nginx:
  pkg.installed: []
  service.enabled: []

/etc/nginx/proxy_params:
  file.managed:
    - source: salt://nginx/proxy_params

/etc/nginx/conf.d/redirect-https.conf.inc:
  file.managed:
    - source: salt://nginx/redirect-https.conf

nginx-reload-base:
  cmd.run:
    - name: systemctl try-restart nginx
    - onchanges:
      - file: /etc/nginx/proxy_params
      - file: /etc/nginx/conf.d/redirect-https.conf.inc
