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
  - name: systemctl try-restart nginx.service
  - onchanges:
    - file: /etc/nginx/conf.d/bertone.batlogg.com.conf
