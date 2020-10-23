# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import packages with context %}

{%- set req_states = packages.pips.required.states %}
{%- set req_pkgs = packages.pips.required.pkgs %}
{%- set wanted_pips = packages.pips.wanted %}
{%- set unwanted_pips = packages.pips.unwanted %}
{%- set pip_config = packages.pips.config %}

{%- if wanted_pips or unwanted_pips %}

  {%- if req_states %}
include:
    {%- for dep in req_states %}
  - {{ dep }}
    {%- endfor %}
  {%- endif %}

### REQ PKGS (without these, some of the WANTED PIPS will fail to install)
pip_req_pkgs:
  pkg.installed:
    - pkgs: {{ req_pkgs | json }}

  {%- if pip_config %}
pip_config:
  file.managed:
    - name: /etc/pip.conf
    - source: salt://{{ tplroot }}/files/pip.conf
    - template: jinja
    - makedirs: True
    - context:
        config: {{ pip_config|json }}
    - require:
      - pkg: pip_req_pkgs
  {%- endif %}

### PYTHON PKGS to install using PIP
# (requires the python-pip deb/rpm installed, either by the system or listed in
# the required packages
  {%- for pn in wanted_pips %}
packages pips install {{ pn }}:
    {%- if grains.os_family in ('Suse',) %}  ##workaround https://github.com/saltstack-formulas/docker-formula/issues/198
  cmd.run:
    - name: /usr/bin/pip install {{ pn }}
    {%- else %}
  pip.installed:
    - name: {{ pn }}
    - reload_modules: true
    {%- endif %}
    - require:
      - pkg: pip_req_pkgs
      {%- if req_states %}
        {%- for dep in req_states %}
      - sls: {{ dep }}
        {%- endfor %}
      {%- endif %}
      {%- if pip_config %}
      - file: pip_config
      {%- endif %}
    - retry: {{ packages.retry_options|json }}
  {%- endfor %}

  {%- for upn in unwanted_pips %}
packages pips remove {{ upn }}:
    {%- if grains.os_family in ('Suse',) %}
  cmd.run:
    - name: /usr/bin/pip uninstall {{ upn }}
    {%- else %}
  pip.removed:
    - name: {{ upn }}
    {%- endif %}
    - require:
      - pkg: pip_req_pkgs
  {%- endfor %}
{%- endif %}
