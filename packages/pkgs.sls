# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "packages/map.jinja" import packages with context %}

{% set req_states = packages.pkgs.required.states %}
{% set req_packages = packages.pkgs.required.pkgs %}
{% set held_packages = packages.pkgs.held %}
{% set wanted_packages = packages.pkgs.wanted %}
{% set unwanted_packages = packages.pkgs.unwanted %}

### PRE-REQ PKGS (without these, some of the WANTED PKGS will fail to install)
pkg_req_pkgs:
  pkg.installed:
    - pkgs: {{ req_packages }}
    {% if req_states %}
    - require:
      {% for dep in req_states %}
      - sls: {{ dep }}
      {% endfor %}
    {% endif %}

{% if held_packages != {} %}
held_pkgs:
  pkg.installed:
    - pkgs:
      {% for p, v in held_packages.items() %}
      - {{ p }}: {{ v }}
      {% endfor %}
    - hold: true
    - update_holds: true
    - require:
      - pkg: pkg_req_pkgs
        {% for dep in req_states %}
      - sls: {{ dep }}
        {% endfor %}
{% endif %}

wanted_pkgs:
  pkg.installed:
    - pkgs: {{ wanted_packages }}
    - hold: false
    - require:
      - pkg: pkg_req_pkgs
      {% if req_states %}
        {% for dep in req_states %}
      - sls: {{ dep }}
        {% endfor %}
      {% endif %}

unwanted_pkgs:
  pkg.purged:
    - pkgs: {{ unwanted_packages }}

