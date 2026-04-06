/home/deploy/apps/honcho:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0755"
    - makedirs: True
    - require:
      - user: deploy

/home/deploy/apps/honcho/docker-compose.yml:
  file.managed:
    - source: salt://apps/honcho/docker-compose.yml
    - user: deploy
    - group: deploy
    - mode: "0644"
    - require:
      - file: /home/deploy/apps/honcho

/home/deploy/apps/honcho/.env:
  file.managed:
    - source: salt://apps/honcho/env.j2
    - template: jinja
    - user: deploy
    - group: deploy
    - mode: "0600"
    - show_changes: false
    - require:
      - file: /home/deploy/apps/honcho

/etc/systemd/system/honcho.service:
  file.managed:
    - source: salt://apps/honcho/honcho.service
    - user: root
    - group: root
    - mode: "0644"

honcho-systemd-daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/honcho.service

honcho-service-enabled:
  service.enabled:
    - name: honcho
    - require:
      - file: /home/deploy/apps/honcho/docker-compose.yml
      - file: /home/deploy/apps/honcho/.env
      - file: /etc/systemd/system/honcho.service
      - cmd: honcho-systemd-daemon-reload

honcho-service-restart:
  cmd.run:
    - name: systemctl restart honcho.service
    - onchanges:
      - file: /home/deploy/apps/honcho/docker-compose.yml
      - file: /home/deploy/apps/honcho/.env
      - file: /etc/systemd/system/honcho.service
    - require:
      - pkg: docker
      - service: honcho-service-enabled
      - cmd: honcho-systemd-daemon-reload
