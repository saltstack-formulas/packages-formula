# -*- coding: utf-8 -*-
# vim: ft=sls
{%- from "./map.jinja" import packages with context %}

{%- if grains['os'] == 'Windows' %}

  {%- if packages.chocolatey %}
    {%- set req_states = packages.chocolatey.required.states %}
    {%- set req_pkgs = packages.chocolatey.required.pkgs %}
    {%- set wanted_chocolatey = packages.chocolatey.wanted %}
    {%- set unwanted_chocolatey = packages.chocolatey.unwanted %}

    {%- if wanted_chocolatey or unwanted_chocolatey %}
      {%- if req_states %}
include:
        {%- for dep in req_states %}
  - {{ dep }}
        {%- endfor %}
      {%- endif %}

chocolatey_req_pkgs:
  pkg.installed:
    - pkgs: {{ req_pkgs | json }}
    - retry: {{ packages.retry_options|json }}

### CHOCOLATEY PACKAGES to install
      {%- if wanted_chocolatey %}
        {%- for choco, settings in wanted_chocolatey.items() %}
{{ choco }}:
  chocolatey.installed:
    - name: {{ choco }}
    - version: {{ '' if 'version' not in settings else settings.version }}
    - source: {{ '' if 'source' not in settings else settings.source }}
    - force: {{ False if 'force' not in settings else settings.force }}
    - pre_versions: {{ False if 'pre_versions' not in settings else settings.pre_versions }}
    - install_args: {{ '' if 'install_args' not in settings else settings.install_args }}
    - override_args: {{ False if 'override_args' not in settings else settings.override_args }}
    - force_x86: {{ False if 'force_x86' not in settings else settings.force_x86 }}
    - package_args: {{ '' if 'package_args' not in settings else settings.package_args }}
    - allow_multiple: {{ False if 'allow_multiple' not in settings else settings.allow_multiple }}
    - require:
      - pkg: chocolatey_req_pkgs
        {%- endfor %}
      {%- endif %}

### CHOCOLATEY PACKAGES to uninstall
      {%- if unwanted_chocolatey %}
        {%- for uchoco in unwanted_chocolatey %}
{{ uchoco }}:
  chocolatey.uninstalled:
    - name: {{ uchoco }}
    - require:
      - pkg: chocolatey_req_pkgs
        {%- endfor %}
      {%- endif %}
    {%- endif %}
  {%- endif %}
{%- endif %}
