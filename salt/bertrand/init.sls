include:
  - bertrand.volumes
  - docker
  - tailscale
  - openclaw
  - nginx

# caution: this is going to run a long time on first execution
/etc/ssl/certs/dhparam.pem:
  cmd.run:
  - name: /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  - unless: test -r /etc/ssl/certs/dhparam.pem

/etc/nginx/conf.d/ssl.conf.inc:
  file.managed:
  - source: salt://letsencrypt/ssl.conf.inc

/etc/nginx/certs:
  file.directory:
  - user: root
  - group: root
  - dir_mode: "0750"

/etc/nginx/certs/namche.ai.cloudflare-origin.crt:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://cloudflare/origin_cert_namche.pem
  - require:
    - file: /etc/nginx/certs

/etc/nginx/certs/cloudflare-origin-ca-rsa-root.pem:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://cloudflare/origin_ca_rsa_root.pem
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
    - file: /etc/nginx/conf.d/ssl.conf.inc
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.crt
    - file: /etc/nginx/certs/cloudflare-origin-ca-rsa-root.pem
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.key
    - file: /etc/nginx/conf.d/namche.ai.conf  
