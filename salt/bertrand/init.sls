include:
  - bertrand.volumes
  - docker
  - tailscale
  - openclaw
  - nginx
  - cloudflare
  - cloudflare.nginx

/etc/nginx/conf.d/namche.ai.conf:
  file.managed:
  - source: salt://bertrand/namche.ai.conf

nginx-reload:
  cmd.run:
  - name: systemctl try-restart nginx.service
  - onchanges:
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.crt
    - file: /etc/nginx/certs/cloudflare-origin-ca-rsa-root.pem
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.key
    - file: /etc/nginx/conf.d/ssl.conf.inc
    - file: /etc/nginx/conf.d/redirect-https.conf.inc
    - file: /etc/nginx/conf.d/namche.ai.conf  
