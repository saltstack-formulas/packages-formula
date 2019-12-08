# -*- coding: utf-8 -*-
# vim: ft=yaml
---
packages:
  pkgs:
    # held:
    #   alien: 8.95-8.fc29
    #   iotop: 0.6-18.fc29
    wanted:
      - git
      - less
      - bc
      - curl
      - fail2ban
    unwanted:
      - avahi-daemon
    required:
      pkgs:
        - git
        - python3-dnf-plugin-versionlock
  pips:
    wanted:
      # - dxpy
      - attrs
    unwanted:
      - campbel
      - reverse_geocode
      - indy-crypto
  gems:
    wanted:
      - progressbar
      - minitest
    unwanted:
      - diff-lcs
      - kitchen-vagrant
      - kwalify
  remote_pkgs:
    zoom: 'https://zoom.us/client/latest/zoom_x86_64.rpm'
