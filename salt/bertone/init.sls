include:
- nginx
- letsencrypt
- letsencrypt.nginx
- php

/etc/nginx/conf.d/bertone.batlogg.com.conf:
  file.managed:
  - source: salt://bertone/bertone.batlogg.com.conf

nginx-reload:
  cmd.run:
  - name: /usr/sbin/nginx -t -c /etc/nginx/nginx.conf && systemctl reload nginx
  - onchanges:
    - file: /etc/nginx/conf.d/bertone.batlogg.com.conf
