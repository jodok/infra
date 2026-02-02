/usr/share/keyrings/tailscale-archive-keyring.gpg:
  file.managed:
    - source: https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg
    - source_hash: 3e03dacf222698c60b8e2f990b809ca1b3e104de127767864284e6c228f1fb39

/etc/apt/sources.list.d/tailscale.sources:
  file.managed:
    - contents: |
        Types: deb
        URIs: https://pkgs.tailscale.com/stable/ubuntu
        Suites: {{ grains['oscodename'] }}
        Components: main
        Signed-By: /usr/share/keyrings/tailscale-archive-keyring.gpg
    - require:
      - file: /usr/share/keyrings/tailscale-archive-keyring.gpg

tailscale:
  pkg.installed:
    - refresh: True
    - require:
      - file: /etc/apt/sources.list.d/tailscale.sources

# exit node configuration
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1
net.ipv6.conf.all.forwarding:
  sysctl.present:
    - value: 1

# performance tuning for tailscale interface
eth0:
  ethtool.coalesce:
    - rx_udp_gro_forwarding: on
    - rx_gro_list: off
# make ethtool settings persistent across reboots
/etc/networkd-dispatcher/routable.d/50-tailscale:
  file.managed:
    - contents: |
        #!/bin/sh
        ethtool -K $(ip -o route get 8.8.8.8 | cut -f 5 -d " ") rx-udp-gro-forwarding on rx-gro-list off
    - mode: 755
    - makedirs: True