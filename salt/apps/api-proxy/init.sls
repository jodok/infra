/etc/api-proxy:
  file.directory:
    - user: root
    - group: www-data
    - mode: "0750"

/etc/api-proxy/config.yaml.example:
  file.managed:
    - source: salt://apps/api-proxy/config.yaml.example
    - user: root
    - group: www-data
    - mode: "0640"
    - require:
      - file: /etc/api-proxy

/etc/systemd/system/api-proxy.service:
  file.managed:
    - source: salt://apps/api-proxy/api-proxy.service
    - user: root
    - group: root
    - mode: "0644"

api-proxy-systemd-daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/api-proxy.service

api-proxy-service-enabled:
  service.enabled:
    - name: api-proxy
    - require:
      - file: /etc/systemd/system/api-proxy.service
      - cmd: api-proxy-systemd-daemon-reload
