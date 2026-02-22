include:
  - bertrand.deploy
  - bertrand.repo
  - bertrand.volumes
  - docker
  - tailscale
  - openclaw
  - nginx
  - nginx.cloudflare

/etc/nginx/certs/namche.ai.cloudflare-origin.crt:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://bertrand/origin_cert_namche.pem
  - require:
    - file: /etc/nginx/certs

/etc/nginx/certs/namche.ai.cloudflare-origin.key:
  file.managed:
  - user: root
  - group: root
  - mode: "0600"
  - contents_pillar: secrets:vault:cloudflare-origin-certificates:namche:key
  - show_changes: false
  - require:
    - file: /etc/nginx/certs

/etc/nginx/conf.d/namche.ai.conf:
  file.managed:
  - source: salt://bertrand/namche.ai.conf

nginx-reload:
  cmd.run:
  - name: systemctl try-restart nginx.service
  - onchanges:
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.crt
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.key
    - file: /etc/nginx/conf.d/ssl.conf.inc
    - file: /etc/nginx/conf.d/redirect-https.conf.inc
    - file: /etc/nginx/conf.d/namche.ai.conf  
