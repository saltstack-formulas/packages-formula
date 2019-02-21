# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "packages/map.jinja" import packages with context %}

{% set req_states = packages.pips.required.states %}
{% set req_pkgs = packages.pips.required.pkgs %}
{% set wanted_pips = packages.pips.wanted %}
{% set unwanted_pips = packages.pips.unwanted %}

### REQ PKGS (without these, some of the WANTED PIPS will fail to install)
pip_req_pkgs:
  pkg.installed:
    - pkgs: {{ req_pkgs }}

### PYTHON PKGS to install using PIP
# (requires the python-pip deb/rpm installed, either by the system or listed in
# the required packages
{% for pn in wanted_pips %}
packages pips install {{ pn }}:
       {%- if grains.os_family in ('Suse',) %}
  cmd.run:
    - name: /usr/bin/pip install {{ pn }}
       {%- else %}
  pip.installed:
    - reload_modules: true
       {%- endif %}
    - require:
      - pkg: pip_req_pkgs
      {% if req_states %}
        {% for dep in req_states %}
      - sls: {{ dep }}
        {% endfor %}
      {% endif %}
{% endfor %}

{% for upn in unwanted_pips %}
packages pips remove {{ upn }}:
       {%- if grains.os_family in ('Suse',) %}
  cmd.run:
    - name: /usr/bin/pip uninstall {{ pn }}
       {%- else %}
  pip.removed
    - name: {{ upn }}
       {%- endif %}
{% endfor %}
