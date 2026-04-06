include:
  - apps.api-proxy
  - apps.honcho
  - apps.searxng
  - hosts.bertrand.deploy
  - hosts.bertrand.honcho-db
  - hosts.bertrand.volumes
  - docker
  - letsencrypt
  - postgres
  - redis
  - tailscale
  - nodejs
  - openclaw
  - nginx
  - nginx.cloudflare

/etc/nginx/certs/namche.ai.cloudflare-origin.crt:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://hosts/bertrand/namche.ai.cloudflare-origin.crt
  - require:
    - file: /etc/nginx/certs

/etc/nginx/certs/namche.ai.cloudflare-origin.key:
  file.managed:
  - user: root
  - group: root
  - mode: "0600"
  - contents_pillar: secrets:vault:cloudflare-origin-certificates:namche.ai.cloudflare-origin.key
  - show_changes: false
  - require:
    - file: /etc/nginx/certs

/etc/nginx/conf.d/namche.ai.conf:
  file.managed:
  - source: salt://hosts/bertrand/namche.ai.conf

/etc/nginx/conf.d/khumbu.namche.ai.conf:
  file.managed:
  - source: salt://hosts/bertrand/khumbu.namche.ai.conf
  - require:
    - cmd: /etc/letsencrypt/live/khumbu.namche.ai/fullchain.pem

/etc/nginx/conf.d/claude-bridge.khumbu.namche.ai.conf:
  file.managed:
  - source: salt://hosts/bertrand/claude-bridge.khumbu.namche.ai.conf
  - require:
    - cmd: /etc/letsencrypt/live/khumbu.namche.ai/fullchain.pem

/etc/nginx/conf.d/honcho.khumbu.namche.ai.conf:
  file.managed:
  - source: salt://hosts/bertrand/honcho.khumbu.namche.ai.conf
  - require:
    - cmd: /etc/letsencrypt/live/khumbu.namche.ai/fullchain.pem

nginx-reload:
  cmd.run:
  - name: systemctl try-restart nginx.service
  - onchanges:
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.crt
    - file: /etc/nginx/certs/namche.ai.cloudflare-origin.key
    - file: /etc/nginx/conf.d/namche.ai.conf  
    - file: /etc/nginx/conf.d/khumbu.namche.ai.conf
    - file: /etc/nginx/conf.d/claude-bridge.khumbu.namche.ai.conf
    - file: /etc/nginx/conf.d/honcho.khumbu.namche.ai.conf
