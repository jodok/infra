exim:
  pkg.installed: []
  service.enabled: []

exim-greylist:
  pkg.installed: []

publicsuffix-list:
  pkg.installed: []

letsencrypt-exim:
  group.present:
  - name: letsencrypt
  - addusers:
    - exim

systemd-exim-try-restart:
  cmd.run:
  - name: systemctl try-restart exim
  - onchanges:
    - file: /etc/exim/exim.conf
