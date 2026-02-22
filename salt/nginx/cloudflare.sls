# caution: this is going to run a long time
/etc/ssl/certs/dhparam.pem:
  cmd.run:
  - name: /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  - unless: test -r /etc/ssl/certs/dhparam.pem

/etc/nginx/certs:
  file.directory:
  - user: root
  - group: root
  - dir_mode: "0750"

/etc/nginx/certs/cloudflare-origin-ca-rsa-root.pem:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://nginx/cloudflare-origin-ca-rsa-root.pem
  - require:
    - file: /etc/nginx/certs

/etc/nginx/default.d:
  file.directory:
  - user: root
  - group: root
  - dir_mode: "0755"

/etc/nginx/default.d/redirect-https.conf:
  file.managed:
  - source: salt://nginx/redirect-https.conf

/etc/nginx/conf.d/ssl.conf.inc:
  file.managed:
  - source: salt://nginx/ssl.conf.inc

nginx-reload-cloudflare:
  cmd.run:
  - name: systemctl try-restart nginx
  - onchanges:
    - file: /etc/nginx/certs/cloudflare-origin-ca-rsa-root.pem
    - file: /etc/nginx/default.d/redirect-https.conf
    - file: /etc/nginx/conf.d/ssl.conf.inc
