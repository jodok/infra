# caution: this is going to run a long time
/etc/ssl/certs/dhparam.pem:
  cmd.run:
  - name: /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  - unless: test -r /etc/ssl/certs/dhparam.pem

/etc/nginx/conf.d/letsencrypt.conf.inc:
  file.managed:
  - source: salt://letsencrypt/letsencrypt.conf.inc

/etc/nginx/conf.d/ssl.conf.inc:
  file.managed:
  - source: salt://letsencrypt/ssl.conf.inc

nginx-reload-letsencrypt:
  cmd.run:
  - name: systemctl try-restart nginx
  - onchanges:
    - file: /etc/nginx/conf.d/ssl.conf.inc
    - file: /etc/nginx/conf.d/letsencrypt.conf.inc
