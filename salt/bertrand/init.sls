include:
  - bertrand.volumes
  - docker
  - tailscale
  - openclaw
  - nginx
  - letsencrypt
  - letsencrypt.nginx

/etc/nginx/conf.d/namche.ai.conf:
  file.managed:
  - source: salt://bertrand/namche.ai.conf

nginx-reload:
  cmd.run:
  - name: systemctl try-restart nginx.service
  - onchanges:
    - file: /etc/nginx/conf.d/namche.ai.conf  
