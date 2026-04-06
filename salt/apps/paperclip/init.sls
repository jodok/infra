paperclip-repo:
  git.cloned:
    - name: https://github.com/paperclipai/paperclip.git
    - target: /home/deploy/apps/paperclip
    - user: deploy
    - require:
      - user: deploy

/home/deploy/apps/paperclip/docker:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0755"
    - require:
      - git: paperclip-repo

/home/deploy/apps/paperclip/docker/docker-compose.yml:
  file.managed:
    - source: salt://apps/paperclip/docker-compose.yml
    - user: deploy
    - group: deploy
    - mode: "0644"
    - require:
      - file: /home/deploy/apps/paperclip/docker

/home/deploy/apps/paperclip/docker/.env:
  file.managed:
    - source: salt://apps/paperclip/env.j2
    - template: jinja
    - user: deploy
    - group: deploy
    - mode: "0600"
    - show_changes: false
    - require:
      - file: /home/deploy/apps/paperclip/docker

/srv/paperclip:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0755"
    - makedirs: True

/etc/systemd/system/paperclip.service:
  file.managed:
    - source: salt://apps/paperclip/paperclip.service
    - user: root
    - group: root
    - mode: "0644"

paperclip-systemd-daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/paperclip.service

paperclip-service-enabled:
  service.enabled:
    - name: paperclip
    - require:
      - file: /home/deploy/apps/paperclip/docker/docker-compose.yml
      - file: /home/deploy/apps/paperclip/docker/.env
      - file: /etc/systemd/system/paperclip.service
      - cmd: paperclip-systemd-daemon-reload

paperclip-service-restart:
  cmd.run:
    - name: systemctl restart paperclip.service
    - onchanges:
      - file: /home/deploy/apps/paperclip/docker/docker-compose.yml
      - file: /home/deploy/apps/paperclip/docker/.env
      - file: /etc/systemd/system/paperclip.service
    - require:
      - pkg: docker
      - service: paperclip-service-enabled
      - cmd: paperclip-systemd-daemon-reload
      - cmd: postgres-restart
      - file: /srv/paperclip
      - postgres_database: paperclip-db
