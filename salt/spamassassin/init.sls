spamassassin:
  pkg.installed: []
  service.enabled: []
  group.present:
  - system: True
  user.present:
  - system: True
  - gid: spamassassin
  - home: /var/lib/spamassassin
  file.managed:
  - name: /etc/sysconfig/spamassassin
  - source: salt://spamassassin/spamassassin.sysconfig

/var/lib/spamassassin:
  file.directory:
  - user: spamassassin
  - group: spamassassin

/etc/mail/spamassassin/local.cf:
  file.managed:
  - source: salt://spamassassin/local.cf

systemd-spamassassin-try-restart:
  cmd.run:
  - name: systemctl try-restart spamassassin
  - onchanges:
    - file: /etc/sysconfig/spamassassin
    - file: /etc/mail/spamassassin/local.cf
