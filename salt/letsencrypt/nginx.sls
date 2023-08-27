# caution: this is going to run a long time
/etc/ssl/certs/dhparam.pem:
  cmd.run:
  - name: /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  - unless: test -r /etc/ssl/certs/dhparam.pem

/etc/nginx/default.d/letsencrypt.conf:
  file.managed:
  - source: salt://letsencrypt/letsencrypt.conf

/etc/nginx/default.d/redirect-https.conf:
  file.managed:
  - source: salt://letsencrypt/redirect-https.conf

/etc/nginx/conf.d/ssl.conf.inc:
  file.managed:
  - source: salt://letsencrypt/ssl.conf.inc

nginx-reload-letsencrypt:
  cmd.run:
  - name: systemctl try-restart nginx
  - onchanges:
    - file: /etc/nginx/conf.d/ssl.conf.inc
    - file: /etc/nginx/conf.d/letsencrypt.conf
    - file: /etc/nginx/conf.d/redirect-https.conf
