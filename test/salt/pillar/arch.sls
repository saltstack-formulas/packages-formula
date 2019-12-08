# -*- coding: utf-8 -*-
# vim: ft=yaml
---
packages:
  pkgs:
    held:
      # - alien
      - iotop
    wanted:
      - ruby
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
  pips:
    wanted:
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
#   remote_pkgs:
#     zoom: 'https://zoom.us/client/latest/zoom_x86_64.tar.xz'
