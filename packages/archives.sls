# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "packages/map.jinja" import packages with context %}

{% set req_packages = packages.pkgs.required.pkgs + ['curl', 'tar', 'bzip2', 'gzip',] %}
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

packages-archive-wanted-remove-prev-{{ package }}:
  file.absent:
    - name: {{ packages.tmpdir }}/{{ package }}
    - require_in:
      - packages-archive-wanted-extract-{{ package }}-directory

packages-archive-wanted-extract-{{ package }}-directory:
  file.directory:
    - names:
      - {{ packages.tmpdir }}/tmp
      - {{ archive.dest }}
    - user: {{ 'root' if "user" not in archive else archive.user }}
    - mode: {{ '0755' if "mode" not in archive else archive.mode }}
    - makedirs: True
    - require_in:
      - cmd: packages-archive-wanted-download-{{ package }}

packages-archive-wanted-download-{{ package }}:
  cmd.run:
    - name: curl -s -L -o {{ packages.tmpdir }}/{{ package }} {{ archive.dl.source }}
    - unless: test -f {{ packages.tmpdir }}/{{ package }}

  {%- if "hashsum" in archive.dl and archive.dl.hashsum %}
    {# refer to https://github.com/saltstack/salt/pull/41914 #}

packages-archive-wanted-{{ package }}-check-hashsum:
  module.run:
    - name: file.check_hash
    - path: {{ packages.tmpdir }}/{{ package }}
    - file_hash: {{ archive.dl.hashsum }}
    - require:
      - cmd: packages-archive-wanted-download-{{ package }}
    - require_in:
      - archive: packages-archive-wanted-install-{{ package }}
  cmd.run:
    - name: rm {{ packages.tmpdir }}/{{ package }}
    - onfail:
      - module: packages-archive-wanted-{{ package }}-check-hashsum
  {%- endif %}

packages-archive-wanted-install-{{ package }}:
  {% if archive.dl.format|trim|lower in ('tar','zip', 'rar',) %}

  archive.extracted:
    - source: file://{{ packages.tmpdir }}/{{ package }}
    - name: {{ archive.dest }}
    - archive_format: {{ archive.dl.format }}
       {%- if 'hashurl' in archive.dl and archive.dl.hashurl %}
    - source_hash: {{ archive.dl.hashurl }}
       {%- endif %}
       {%- if 'options' in archive and archive.options %}
    - options: {{ archive.options }}
    - enforce_toplevel: {{ 'False' if "strip-components" in archive.options else 'True' }}
       {%- endif %}
    - unless: test -d {{ archive.dest }}
  cmd.run:
    - name: rm {{ packages.tmpdir }}/{{ package }}
    - onfail:
      - archive: packages-archive-wanted-install-{{ package }}

  {% else %}

  test.show_notification:
    - text: |
        The value of "packages.archives.wanted.{{ package }}.dl.format' is unsupported (skipping {{ package }}).

  {% endif %} 
    - onchanges:
      - packages-archive-wanted-download-{{ package }}
    - require_in:
      - packages-archive-wanted-cleanup-{{ package }}

packages-archive-wanted-cleanup-{{ package }}:
  file.absent:
    - name: {{ packages.tmpdir }}/{{ package }}
    - onchanges:
      - packages-archive-wanted-install-{{ package }}

{%- endfor %}
