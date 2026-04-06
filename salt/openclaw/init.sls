/home/deploy/apps/openclaw-claude-bridge:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0755"
    - makedirs: True
    - require:
      - user: deploy

openclaw-claude-bridge-repo:
  cmd.run:
    - name: git clone https://github.com/shinglokto/openclaw-claude-bridge.git /home/deploy/apps/openclaw-claude-bridge && git -C /home/deploy/apps/openclaw-claude-bridge checkout c828f45bfc7a8690487a1b06d0dec591b9857fcf
    - runas: deploy
    - creates: /home/deploy/apps/openclaw-claude-bridge/.git
    - require:
      - file: /home/deploy/apps/openclaw-claude-bridge

/home/deploy/apps/openclaw-claude-bridge/.env:
  file.managed:
    - source: salt://openclaw/bridge.env.j2
    - template: jinja
    - user: deploy
    - group: deploy
    - mode: "0600"
    - show_changes: false
    - require:
      - git: openclaw-claude-bridge-repo

openclaw-claude-bridge-install:
  cmd.run:
    - name: npm ci
    - cwd: /home/deploy/apps/openclaw-claude-bridge
    - runas: deploy
    - creates: /home/deploy/apps/openclaw-claude-bridge/node_modules
    - env:
        HOME: /home/deploy
        PATH: /home/deploy/.local/bin:/usr/local/bin:/usr/bin:/bin
    - require:
      - pkg: nodejs
      - git: openclaw-claude-bridge-repo

/etc/systemd/system/openclaw-claude-bridge.service:
  file.managed:
    - source: salt://openclaw/openclaw-claude-bridge.service
    - user: root
    - group: root
    - mode: "0644"

openclaw-claude-bridge-systemd-daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/openclaw-claude-bridge.service

openclaw-claude-bridge-service-enabled:
  service.enabled:
    - name: openclaw-claude-bridge
    - require:
      - file: /etc/systemd/system/openclaw-claude-bridge.service
      - file: /home/deploy/apps/openclaw-claude-bridge/.env
      - cmd: openclaw-claude-bridge-install
      - cmd: openclaw-claude-bridge-systemd-daemon-reload

openclaw-claude-bridge-service-restart:
  cmd.run:
    - name: systemctl restart openclaw-claude-bridge.service
    - onchanges:
      - file: /home/deploy/apps/openclaw-claude-bridge/.env
      - file: /etc/systemd/system/openclaw-claude-bridge.service
    - require:
      - service: openclaw-claude-bridge-service-enabled
      - cmd: openclaw-claude-bridge-systemd-daemon-reload
