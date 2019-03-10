# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "packages/map.jinja" import packages with context %}

{% set req_states = packages.npms.required.states %}
{% set req_pkgs = packages.npms.required.pkgs %}
{% set wanted_npms = packages.npms.wanted %}
{% set unwanted_npms = packages.npms.unwanted %}

### REQ PKGS (without these, some of the WANTED PIPS will fail to install)
npm_req_pkgs:
  pkg.installed:
    - pkgs: {{ req_pkgs | json }}

### NPM PKGS to install using npm
# (requires the npm deb/rpm installed, either by the system or listed in
# the required packages
{% for nn in wanted_npms %}
{{ nn }}:
  npm.installed:
    - reload_modules: true
    - require:
      - pkg: npm_req_pkgs
      {% if req_states %}
        {% for dep in req_states %}
      - sls: {{ dep }}
        {% endfor %}
      {% endif %}
{% endfor %}

{% for upn in unwanted_npms %}
{{ upn }}:
  npm.removed
{% endfor %}
