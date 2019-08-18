# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import packages with context %}
 
    {%- for package in packages.golang.goget %}

packages-golang-goget-cmd-run-go-get-{{ package }}:
  cmd.run:
    - name: go get {{ package }}
    - runas: {{ packages.rootuser }}

    {%- endfor %}
