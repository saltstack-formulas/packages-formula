# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "packages/map.jinja" import packages with context %}

{% set req_states = packages.pkgs.required.states %}
{% set req_packages = packages.pkgs.required.pkgs %}
{% set wanted_packages = packages.pkgs.wanted %}
{% set unwanted_packages = packages.pkgs.unwanted %}

### PRE-REQ PKGS (without these, some of the WANTED PKGS will fail to install)
{% if req_packages != {} %}
prereq_packages:
  pkg.installed:
    - pkgs: {{ req_packages }}
    {% if req_states %}
    - require:
      {% for dep in req_states %}
      - sls: {{ dep }}
      {% endfor %}
    {% endif %}
{% endif %}

{% if wanted_packages != {} %}
wanted_packages:
  pkg.installed:
    - pkgs: {{ wanted_packages }}
    - require:
      - pkg: prereq_packages
      {% if req_states %}
        {% for dep in req_states %}
      - sls: {{ dep }}
        {% endfor %}
      {% endif %}
{% endif %}

{% if unwanted_packages != {} %}
unwanted_packages:
  pkg.purged:
    - pkgs: {{ unwanted_packages }}
{% endif %}

