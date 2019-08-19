packages:
  pkgs:
    # A dict of "package: version" pairs:
    held:
      alien: 8.95
      iotop: 0.6-2

    # Alternativelly, held packages can also be specified as a list with
    # no versions. In this case, the package will be held in the installed
    # version.
    # held:
    #   - alien
    #   - iotop
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
        - libpython2.7-dev
        - python-pip
    wanted:
      - dxpy
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
  # Disable Snaps testing in Ubuntu 18 due to 
  # https://github.com/saltstack-formulas/packages-formula/issues/44
  # snaps:
  #   wanted:
  #     - hello-world
  #   classic:
  #     - test-snapd-hello-classic
  #   unwanted:
  #     - goodbye-world
  archives:
    wanted:
      terminator:
        dest: /usr/local/terminator/
        options: '--strip-components=1'  #recommended option, but beware tarbombs
        dl:
          format: tar
          source: https://launchpad.net/terminator/gtk3/1.91/+download/terminator-1.91.tar.gz
          #hashurl: https://launchpad.net/terminator/gtk3/1.91/+download/terminator-1.91.tar.gz/+md5
          hashsum: md5=2eed999d7a41f2e18eaa511bbbf80f58
      phantomjs:
        dest: /usr/local/src/    #beware tarbombs
        user: root
        mode: '0700'
        dl:
          format: tar
          source: https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
          hashsum: md5=1c947d57fce2f21ce0b43fe2ed7cd361
      blockbox:
        dest: /usr/local/src/
        dl:
          format: raw
          source: https://raw.githubusercontent.com/openstack/cinder/master/contrib/block-box/docker-compose.yml
          hashsum: 1751f8e4f6b4cddd8c4843a0f4473274
      golang:
        dest: /usr/local
        dl:
          format: tar
          source: https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
          hashsum: 66d83bfb5a9ede000e33c6579a91a29e6b101829ad41fffb5c5bb6c900e109d9
    unwanted:
      - /usr/local/boring_archive_software

  remote_pkgs:
    zoom: 'https://zoom.us/client/latest/zoom_amd64.deb'

  golang:
    goget:
      - github.com/golang/example/hello
      - github.com/golang/example/outyet
    clean:
      - github.com/golang/example/hello
      - github.com/golang/example/outyet
