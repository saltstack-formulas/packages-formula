# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "packages/map.jinja" import packages with context %}

{% set req_states = packages.npms.required.states %}
{% set req_pkgs = packages.npms.required.pkgs %}
{% set wanted_npms = packages.npms.wanted %}
{% set unwanted_npms = packages.npms.unwanted %}

{% if req_states %}
include:
  {% for dep in req_states %}
  - {{ dep }}
  {% endfor %}
{% endif %}

### REQ PKGS (without these, some of the WANTED PIPS will fail to install)
npm_req_pkgs:
  pkg.installed:
    - pkgs: {{ req_pkgs | json }}

### NPM PKGS to install using npm
# (requires the npm binary installed, either by the system or listed in
# the required packages

{% if packages.npms.dir is defined %}
npms_dir:
  file.directory:
    - name: {{ packages.npms.dir }}
    - user: {{ 'root' if 'user' not in packages.npms else packages.npms.user }}
    - group: {{ 'root' if 'group' not in packages.npms else packages.npms.group }}
    - mode: {{ '0755' if 'mode' not in packages.npms else packages.npms.mode }}
    - makedirs: True
{% endif %}

wanted_npms:
  npm.installed:
    - pkgs: {{ wanted_npms | json }}
    {% if packages.npms.dir is defined %}
    - dir: {{ packages.npms.dir }}
    {% endif %}
    {% if packages.npms.user is defined %}
    - user: {{ packages.npms.user }}
    {% endif %}
    {% if packages.npms.registry is defined %}
    - registry: {{ packages.npms.registry }}
    {% endif %}
    {% if packages.npms.env is defined %}
    - env: {{ packages.npms.env | json }}
    {% endif %}
    {% if packages.npms.force_reinstall is defined %}
    - force_reinstall: {{ packages.npms.force_reinstall }}
    {% endif %}
    - require:
      {% if packages.npms.dir is defined %}
      - file: npms_dir
      {% endif %}
      - pkg: npm_req_pkgs
      {% if req_states %}
        {% for dep in req_states %}
      - sls: {{ dep }}
        {% endfor %}
      {% endif %}

{% for upn in unwanted_npms %}
{{ upn }}:
  npm.removed
{% endfor %}
