include:
- nginx
- letsencrypt
- letsencrypt.nginx
- php

exim:
  pkg.installed: []
  service.enabled: []

/etc/nginx/conf.d/bertone.batlogg.com.conf:
  file.managed:
  - source: salt://bertone/bertone.batlogg.com.conf

/etc/nginx/conf.d/nr.gy.conf:
  file.managed:
  - source: salt://bertone/nr.gy.conf

nginx-reload:
  cmd.run:
  - name: systemctl try-restart nginx.service
  - onchanges:
    - file: /etc/nginx/conf.d/bertone.batlogg.com.conf
    - file: /etc/nginx/conf.d/nr.gy.conf
