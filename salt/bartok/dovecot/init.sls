dovecot:
  pkg.installed: []
  service.enabled: []
/etc/dovecot/conf.d/10-auth.conf:
  file.managed:
  - source: salt://bartok/dovecot/10-auth.conf
  - mode: "0644"
/etc/dovecot/conf.d/10-mail.conf:
  file.managed:
  - source: salt://bartok/dovecot/10-mail.conf
  - mode: "0644"
/etc/dovecot/conf.d/10-master.conf:
  file.managed:
  - source: salt://bartok/dovecot/10-master.conf
  - mode: "0644"
/etc/dovecot/conf.d/10-ssl.conf:
  file.managed:
  - source: salt://bartok/dovecot/10-ssl.conf
  - mode: "0644"
# caution: this is going to run a long time
/etc/dovecot/dh.pem:
  cmd.run:
  - name: /usr/bin/openssl dhparam -out /etc/dovecot/dh.pem 4096
  - unless: test -r /etc/dovecot/dh.pem

# sieve
dovecot-pigeonhole:
  pkg.installed: []
/etc/dovecot/conf.d/20-imap.conf:
  file.managed:
  - source: salt://bartok/dovecot/20-imap.conf
  - mode: "0644"
/etc/dovecot/conf.d/90-sieve.conf:
  file.managed:
  - source: salt://bartok/dovecot/90-sieve.conf
  - mode: "0644"

/usr/lib64/dovecot/sieve/sa-learn-ham.sh:
  file.managed:
  - source: salt://bartok/dovecot/sa-learn-ham.sh
  - mode: "0755"
/usr/lib64/dovecot/sieve/report-ham.sieve:
  file.managed:
  - source: salt://bartok/dovecot/report-ham.sieve
  - mode: "0644"
/bin/sievec /usr/lib64/dovecot/sieve/report-ham.sieve:
  cmd.run:
  - onchanges:
    - file: /usr/lib64/dovecot/sieve/report-ham.sieve

/usr/lib64/dovecot/sieve/sa-learn-spam.sh:
  file.managed:
  - source: salt://bartok/dovecot/sa-learn-spam.sh
  - mode: "0755"
/usr/lib64/dovecot/sieve/report-spam.sieve:
  file.managed:
  - source: salt://bartok/dovecot/report-spam.sieve
  - mode: "0644"
/bin/sievec /usr/lib64/dovecot/sieve/report-spam.sieve:
  cmd.run:
  - onchanges:
    - file: /usr/lib64/dovecot/sieve/report-spam.sieve

#/var/lib/dovecot/sieve:
#  file.directory:
#  - user: dovecot
#  - group: dovecot

systemd-dovecot-reload:
  cmd.run:
  - name: systemctl reload dovecot
  - onchanges:
    - file: /etc/dovecot/conf.d/10-auth.conf
    - file: /etc/dovecot/conf.d/10-mail.conf
    - file: /etc/dovecot/conf.d/10-master.conf
    - file: /etc/dovecot/conf.d/10-ssl.conf
    - file: /etc/dovecot/conf.d/20-imap.conf
    - file: /etc/dovecot/conf.d/90-sieve.conf
