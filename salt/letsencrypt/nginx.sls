# caution: this is going to run a long time
/etc/ssl/certs/dhparam.pem:
  cmd.run:
  - name: /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  - unless: test -r /etc/ssl/certs/dhparam.pem

/etc/nginx/snippets:
  file.directory:
  - mode: "0755"
  - user: root
  - group: root

/etc/nginx/snippets/letsencrypt.conf:
  file.managed:
  - source: salt://letsencrypt/letsencrypt.conf

/etc/nginx/snippets/ssl.conf:
  file.managed:
  - source: salt://letsencrypt/ssl.conf
