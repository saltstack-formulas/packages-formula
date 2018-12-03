# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "packages/map.jinja" import packages with context %}

{% set req_packages = packages.pkgs.required.pkgs + packages.archives.pkgs.required %}
include:
  - packages.pkgs

extend:
  pkg_req_pkgs:
    pkg.installed:
      - pkgs: {{ req_packages }}

{% set wanted_archives = packages.archives.required.archives %}
{% do wanted_archives.update( packages.archives.wanted ) %}
{% set unwanted_archives = packages.archives.unwanted %}

  # unwanted 'archive' software
{% for file_or_directory in unwanted_archives %}
packages-archive-unwanted-{{ file_or_directory }}:
  file.absent:
    - name: {{ file_or_directory }}
{% endfor %}

  # wanted 'archive' software
{% for package, archive in wanted_archives.items() %}
   {%- set archivename = archive.dl.source.split('/')[-1] %}

packages-archive-wanted-target-{{ package }}-directory:
  file.directory:
    - names:
      - {{ packages.tmpdir or '/tmp' }}
      - {{ archive.dest }}
    - user: {{ 'root' if 'user' not in archive else archive.user }}
    - mode: {{ '0755' if 'mode' not in archive else archive.mode }}
    - makedirs: True
    - require_in:
      - packages-archive-wanted-download-{{ package }}

   {%- if 'format' in archive.dl.format and archive.dl.format in packages.archives.types %}

packages-archive-wanted-remove-prev-{{ package }}:
  file.absent:
    - name: {{ packages.tmpdir }}/{{ archivename }}
    - require_in:
      - packages-archive-wanted-target-{{ package }}-directory

packages-archive-wanted-download-{{ package }}:
  cmd.run:
    - name: curl -s -L -o {{ packages.tmpdir }}/{{ archivename }} {{ archive.dl.source }}
    - unless: test -f {{ packages.tmpdir }}/{{ archivename }}/

      {%- if 'hashsum' in archive.dl and archive.dl.hashsum %}
         {# see https://github.com/saltstack/salt/pull/41914 #}

packages-archive-wanted-{{ package }}-check-hashsum:
  module.run:
    - name: file.check_hash
    - path: {{ packages.tmpdir }}/{{ archivename }}
    - file_hash: {{ archive.dl.hashsum }}
    - require:
      - packages-archive-wanted-download-{{ package }}
    - require_in:
      - archive: packages-archive-wanted-install-{{ package }}

      {%- endif %}

packages-archive-wanted-install-{{ package }}:
  archive.extracted:
    - source: file://{{ packages.tmpdir }}/{{ archivename }}
    - name: {{ archive.dest }}/
    - archive_format: {{ archive.dl.format }}
         {%- if 'hashurl' in archive.dl and archive.dl.hashurl %}
    - source_hash: {{ archive.dl.hashurl }}
         {%- endif %}
         {%- if 'options' in archive and archive.options %}
    - options: {{ archive.options }}
    - enforce_toplevel: {{ 'False' if 'strip-components' in archive.options else 'True' }}
         {%- endif %}
    - unless: test -d {{ archive.dest }}
    - require:
      - packages-archive-wanted-download-{{ package }}
      - module: packages-archive-wanted-{{ package }}-check-hashsum
    - require_in:
      - packages-archive-wanted-cleanup-{{ package }}

packages-archive-wanted-cleanup-{{ package }}:
  file.absent:
    - name: {{ packages.tmpdir }}/{{ archivename }}
    - onchanges:
      - packages-archive-wanted-install-{{ package }}

   {%- else %}

packages-archive-wanted-download-{{ package }}:
  file.managed:
    - name: {{ archive.dest }}/{{ archivename }}
    - source: {{ archive.dl.source }}
    - mode: {{ '0755' if archive.dl.format in ('bin',) else '0644' if 'mode' not in archive else archive.mode }}
    - user: {{ 'root' if 'user' not in archive else archive.user }}
    - makedirs: True
       {%- if 'hashsum' in archive.dl and archive.dl.hashsum %}
    - source_hash: {{ archive.dl.hashsum }}
       {%- else %}
    - skip_verify: True
       {%- endif %}

   {% endif %} 
{%- endfor %}
