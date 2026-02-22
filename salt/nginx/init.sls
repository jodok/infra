nginx:
  pkg.installed: []
  service.enabled: []

/etc/nginx/proxy_params:
  file.managed:
    - source: salt://nginx/proxy_params

/etc/nginx/conf.d/redirect-https.conf.inc:
  file.managed:
    - source: salt://nginx/redirect-https.conf

/var/www/html:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: "2775"
    - makedirs: True

www-data:
  group.present:
    - addusers:
      - deploy
    - require:
      - user: deploy

nginx-reload-base:
  cmd.run:
    - name: systemctl try-restart nginx
    - onchanges:
      - file: /etc/nginx/proxy_params
      - file: /etc/nginx/conf.d/redirect-https.conf.inc
