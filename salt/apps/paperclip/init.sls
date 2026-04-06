paperclip-repo:
  git.cloned:
    - name: https://github.com/paperclipai/paperclip.git
    - target: /home/deploy/apps/paperclip
    - user: deploy
    - require:
      - user: deploy

paperclip-pnpm-install:
  cmd.run:
    - name: pnpm install --frozen-lockfile
    - cwd: /home/deploy/apps/paperclip
    - runas: deploy
    - require:
      - git: paperclip-repo
    - unless: test -d /home/deploy/apps/paperclip/node_modules

paperclip-build:
  cmd.run:
    - name: pnpm -r build
    - cwd: /home/deploy/apps/paperclip
    - runas: deploy
    - require:
      - cmd: paperclip-pnpm-install
    - unless: test -d /home/deploy/apps/paperclip/server/dist

/home/deploy/apps/paperclip/.env:
  file.managed:
    - source: salt://apps/paperclip/env.j2
    - template: jinja
    - user: deploy
    - group: deploy
    - mode: "0600"
    - show_changes: false
    - require:
      - git: paperclip-repo

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
      - cmd: paperclip-build
      - file: /home/deploy/apps/paperclip/.env
      - file: /etc/systemd/system/paperclip.service
      - cmd: paperclip-systemd-daemon-reload

paperclip-service-restart:
  cmd.run:
    - name: systemctl restart paperclip.service
    - onchanges:
      - file: /home/deploy/apps/paperclip/.env
      - file: /etc/systemd/system/paperclip.service
    - require:
      - service: paperclip-service-enabled
      - cmd: paperclip-systemd-daemon-reload
      - postgres_database: paperclip-db
