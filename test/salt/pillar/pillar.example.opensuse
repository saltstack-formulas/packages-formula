packages:
  pkgs:
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
  # Not testing pips in opensuse because it requires upgrading a bunch of
  # pip dependencies which are out of the scope of this formula.
  # If you can provide a PR to fix this tests, you're welcomed!
  # pips:
  gems:
    wanted:
      - progressbar
      - minitest
    unwanted:
      - diff-lcs
      - kitchen-vagrant
      - kwalify
  remote_pkgs:
    zoom: 'https://zoom.us/client/latest/zoom_openSUSE_x86_64.rpm'
