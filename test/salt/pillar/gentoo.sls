# -*- coding: utf-8 -*-
# vim: ft=yaml
---
packages:
  pkgs:
    held:
      - app-arch/alien
      - sys-process/iotop
    wanted:
      - net-analyzer/netcat
      - dev-lang/ruby
      - dev-vcs/git
      - sys-apps/less
      - sys-devel/bc
      - net-misc/curl
      # - net-analyzer/fail2ban
    unwanted:
      - net-dns/avahi
    required:
      pkgs:
        - dev-vcs/git
  pips:
    ### Not working:
    ###   ERROR: (Gentoo) Please run pip with the --user option to avoid
    ###                   breaking python-exec
    # wanted:
    #   - attrs
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
  # remote_pkgs:
  #   zoom: 'https://zoom.us/client/latest/zoom_x86_64.tar.xz'

  # Override the default setting to prevent wasteful delays in Travis
  retry_options:
    attempts: 1
