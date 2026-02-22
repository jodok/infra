/etc/namche-api-proxy:
  file.directory:
    - user: root
    - group: deploy
    - mode: "0750"

# configure manually for now
#/etc/namche-api-proxy/proxy.env:
#  file.managed:
#    - source: salt://apps/namche-api-proxy/proxy.env
#    - user: root
#    - group: deploy
#    - mode: "0640"
#    - require:
#      - file: /etc/namche-api-proxy

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
