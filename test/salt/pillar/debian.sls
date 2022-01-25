# -*- coding: utf-8 -*-
# vim: ft=yaml
---
# Dependency (node)
node:
  pkg:
    use_upstream_repo: true    # Debian family only

packages:
  pkgs:
    # A dict of "package: version" pairs:
    # held:
    #   alien: 8.95
    #   iotop: 0.6-2

    # Alternativelly, held packages can also be specified as a list with
    # no versions. In this case, the package will be held in the installed
    # version.
    held:
      - alien
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
        - wget
        - git

  pips:
    required:
      pkgs:
        # Pillar parameters have precedence so, if you add a package here, you
        # should also add the python pip package you want. Otherwise, the formula
        # will take care of getting it if needed.
        - python3-pip
    wanted:
      # TODO: Investigate why this is longer working
      # - dxpy
      - attrs
    unwanted:
      - campbel
      - reverse_geocode
      - indy-crypto
    config:
      global:
        timeout: 120
        default-timeout: 120
        # proxy: http://proxy.example.com:3128

  gems:
    wanted:
      - progressbar
      - minitest
    unwanted:
      - diff-lcs
      - kitchen-vagrant
      - kwalify

  snaps:
    # Disable `wanted` Snap testing in Debian due to failure in GitLab CI
    # https://gitlab.com/myii/packages-formula/-/jobs/908520657#L7446
    # wanted:
    #   - hello-world
    # Disable `classic` Snap testing in Debian due to an issue similar to
    # https://github.com/saltstack-formulas/packages-formula/issues/44
    # quite possibly, better described here
    # https://bugs.launchpad.net/snapd/+bug/1826662
    # classic:
    #   - test-snapd-hello-classic
    unwanted:
      - bare

  # yamllint disable rule:line-length
  npms:
    dir: /home/kitchen/npms   # The target directory in which to install the package, or None for global installation
    user: kitchen             # The user to run NPM with (and to assign to `dir`)
    group: kitchen            # The group to assign to `dir`
    mode: '0755'              # The permissions to assign to `dir`
    # registry: None          # The NPM registry from which to install the package
    # env: None               # A list of environment variables to be set prior to execution
    # force_reinstall: False  # Install the package even if it is already installed
    required:
      states:
        - node.package.install
    wanted:
      # Valid formats:
      #
      # @google-cloud/bigquery@^0.9.6
      # @foobar
      # buffer-equal-constant-time@1.0.1
      # coffee-script
      # You need to quote the package if it starts with '@'
      - '@low-systems/example@1.1.58'
      - hello-world-npm
      - sax
      - coffee-script@1.0.1
    unwanted:
      - gist
  # yamllint enable rule:line-length

  archives:
    wanted:
      terminator:
        dest: /usr/local/terminator/
        options: '--strip-components=1'  # recommended option, but beware tarbombs
        dl:
          format: tar
          # yamllint disable rule:line-length
          source: https://launchpad.net/terminator/gtk3/1.91/+download/terminator-1.91.tar.gz
          # hashurl: https://launchpad.net/terminator/gtk3/1.91/+download/terminator-1.91.tar.gz/+md5
          # yamllint enable rule:line-length
          hashsum: md5=2eed999d7a41f2e18eaa511bbbf80f58
      phantomjs:
        dest: /usr/local/src/  # beware tarbombs
        user: root
        mode: '0700'
        dl:
          format: tar
          # yamllint disable rule:line-length
          source: https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
          hashsum: md5=1c947d57fce2f21ce0b43fe2ed7cd361
          # yamllint enable rule:line-length
      kubectl:
        dest: /usr/local/bin
        dl:
          format: bin
          # yamllint disable-line rule:line-length
          source: https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/darwin/amd64/kubectl
    unwanted:
      - /usr/local/boring_archive_software

  remote_pkgs:
    zoom: 'https://zoom.us/client/latest/zoom_amd64.deb'

  # Override the default setting to prevent wasteful delays in Travis
  retry_options:
    attempts: 1
