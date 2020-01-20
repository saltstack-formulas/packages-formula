# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import packages with context %}

    {%- for package in packages.golang.clean %}

packages-golang-clean-{{ package }}-cmd-run:
  cmd.run:
    - name: go clean -i {{ package }}...
    - runas: {{ packages.rootuser }}

    {%- endfor %}
