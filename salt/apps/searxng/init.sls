/home/deploy/apps/searxng:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0755"
    - makedirs: True
    - require:
      - user: deploy

/home/deploy/apps/searxng/core-config:
  file.directory:
    - mode: "0755"
    - require:
      - file: /home/deploy/apps/searxng

/home/deploy/apps/searxng/docker-compose.yml:
  file.managed:
    - source: salt://apps/searxng/docker-compose.yml
    - user: deploy
    - group: deploy
    - mode: "0644"
    - require:
      - file: /home/deploy/apps/searxng

/home/deploy/apps/searxng/.env:
  file.managed:
    - source: salt://apps/searxng/.env
    - user: deploy
    - group: deploy
    - mode: "0644"
    - require:
      - file: /home/deploy/apps/searxng

/etc/systemd/system/searxng.service:
  file.managed:
    - source: salt://apps/searxng/searxng.service
    - user: root
    - group: root
    - mode: "0644"

searxng-systemd-daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/searxng.service

searxng-service-enabled:
  service.enabled:
    - name: searxng
    - require:
      - file: /home/deploy/apps/searxng/docker-compose.yml
      - file: /home/deploy/apps/searxng/.env
      - file: /etc/systemd/system/searxng.service
      - cmd: searxng-systemd-daemon-reload

searxng-service-restart:
  cmd.run:
    - name: systemctl restart searxng.service
    - onchanges:
      - file: /home/deploy/apps/searxng/docker-compose.yml
      - file: /home/deploy/apps/searxng/.env
      - file: /etc/systemd/system/searxng.service
    - require:
      - pkg: docker
      - service: searxng-service-enabled
      - cmd: searxng-systemd-daemon-reload
