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

deploy-www-data-group-membership:
  user.present:
    - name: deploy
    - optional_groups:
      - www-data
    - require:
      - user: deploy-user

nginx-reload-base:
  cmd.run:
    - name: systemctl try-restart nginx
    - onchanges:
      - file: /etc/nginx/proxy_params
      - file: /etc/nginx/conf.d/redirect-https.conf.inc
