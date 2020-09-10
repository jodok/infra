duplicity:
  pkg.installed: []

/root/bin/backup.sh:
  file.managed:
  - mode: "0700"
  - source: salt://duplicity/backup.sh.j2
  - template: jinja
  - makedirs: true
  - dirmode: "0755"

/etc/systemd/system/duplicity.service:
  file.managed:
    - source: salt://duplicity/duplicity.service

/etc/systemd/system/duplicity.timer:
  file.managed:
    - source: salt://duplicity/duplicity.timer

duplicity.timer:
  service.enabled: []

systemd-duplicity-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/duplicity.service
      - file: /etc/systemd/system/duplicity.timer
