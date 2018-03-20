# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "packages/map.jinja" import packages with context %}

{% set req_states = packages.snaps.required.states %}
{% set wanted_snaps = packages.snaps.wanted %}
{% set unwanted_snaps = packages.snaps.unwanted %}

{%- if packages.snaps.package %}
  {% if packages.snaps.wanted or packages.snaps.unwanted %}

### REQ PKGS (without this, SNAPS can fail to install/uninstall)
include:
  - packages.pkgs

extend: 
  unwanted_pkgs:
    pkg.removed:
      - pkgs: {{ packages.snaps.collides }}
    {% if req_states %}
      - require:
      {% for dep in req_states %}
        - sls: {{ dep }}
      {% endfor %}
    {% endif %}
  pkg_req_pkgs:
    pkg.installed:
      - pkgs: [ {{ packages.snaps.package }}, ]
    {% if req_states %}
      - require:
      {% for dep in req_states %}
        - sls: {{ dep }}
      {% endfor %}
    {% endif %}

   {% if packages.snaps.symlink %}
     {# classic confinement requires snaps under /snap or symlink from #}
     {# /snap to /var/lib/snapd/snap #}
packages-snap-classic-symlink:
  file.symlink:
    - name: /snap
    - target: /var/lib/snapd/snap
    - unless: test -d /snap
    - require:
      - pkg: pkg_req_pkgs
      - pkg: unwanted_pkgs
   {% endif %}

   {% for snap in packages.snaps.service %}
packages-{{ snap }}-service:
  service.running:
    - name: {{ snap }}
    - enable: true
    - require:
      - pkg: pkg_req_pkgs
      - pkg: unwanted_pkgs
   {% endfor %}
  
### SNAPS to install

  {% for snap in wanted_snaps %}
packages-snapd-{{ snap }}-wanted:
  cmd.run:
    - name: snap install {{ snap }}
    - unless: snap list {{ snap }}
    - output_loglevel: quiet
    - require:
      - pkg: pkg_req_pkgs
      - pkg: unwanted_pkgs
  {% endfor %}

### SNAPS to uninstall

  {% for snap in unwanted_snaps %}
packages-snapd-{{ snap }}-unwanted:
  cmd.run:
    - name: snap remove {{ snap }}
    - onlyif: snap list {{ snap }}
    - output_loglevel: quiet
    - require:
      - pkg: pkg_req_pkgs
      - pkg: unwanted_pkgs
  {% endfor %}

  {% endif %}
{% endif %}
