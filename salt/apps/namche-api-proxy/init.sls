/etc/namche-api-proxy:
  file.directory:
    - user: root
    - group: deploy
    - mode: "0750"

/etc/namche-api-proxy/routes.config.json:
  file.managed:
    - source: salt://apps/namche-api-proxy/routes.config.json
    - user: root
    - group: deploy
    - mode: "0640"
    - require:
      - file: /etc/namche-api-proxy

/etc/namche-api-proxy/webhook-proxy.env:
  file.managed:
    - source: salt://apps/namche-api-proxy/webhook-proxy.env
    - user: root
    - group: deploy
    - mode: "0640"
    - require:
      - file: /etc/namche-api-proxy

/etc/systemd/system/namche-api-proxy.service:
  file.managed:
    - source: salt://apps/namche-api-proxy/namche-api-proxy.service
    - user: root
    - group: root
    - mode: "0644"

namche-api-proxy-systemd-daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/namche-api-proxy.service

namche-api-proxy-service-enabled:
  service.enabled:
    - name: namche-api-proxy
    - require:
      - file: /etc/systemd/system/namche-api-proxy.service
      - cmd: namche-api-proxy-systemd-daemon-reload

namche-api-proxy-service-running:
  service.running:
    - name: namche-api-proxy
    - onlyif: test -f /home/deploy/apps/namche-api-proxy/index.mjs
    - require:
      - service: namche-api-proxy-service-enabled
      - file: /etc/namche-api-proxy/routes.config.json
      - file: /etc/namche-api-proxy/webhook-proxy.env
    - watch:
      - file: /etc/systemd/system/namche-api-proxy.service
      - file: /etc/namche-api-proxy/routes.config.json
      - file: /etc/namche-api-proxy/webhook-proxy.env
