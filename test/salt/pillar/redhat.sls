# -*- coding: utf-8 -*-
# vim: ft=yaml
---
packages:
  pkgs:
    held:
      # - alien
      - iotop
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
        - yum-plugin-versionlock
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
      # minitest requires Ruby version ~> 2.2.
      # ruby 2.0.0p648 (2015-12-16) [x86_64-linux]
      # https://stackoverflow.com/a/50931910
      # $ sudo amazon-linux-extras install ruby2.6
      # - minitest
      - strings: 0.1.8
      - regexp_parser: 1.7.0
    unwanted:
      - diff-lcs
      - kitchen-vagrant
      - kwalify
  remote_pkgs:
    zoom: 'https://zoom.us/client/latest/zoom_x86_64.rpm'

  # Override the default setting to prevent wasteful delays in Travis
  retry_options:
    attempts: 1
