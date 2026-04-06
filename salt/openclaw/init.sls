/home/deploy/apps/openclaw-claude-bridge:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0755"
    - makedirs: True
    - require:
      - user: deploy

openclaw-claude-bridge-repo:
  git.latest:
    - name: {{ salt['pillar.get']('openclaw:claude_bridge:repo') }}
    - target: /home/deploy/apps/openclaw-claude-bridge
    - rev: {{ salt['pillar.get']('openclaw:claude_bridge:rev') }}
    - user: deploy
    - force_fetch: True
    - force_checkout: True
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
    - onchanges:
      - git: openclaw-claude-bridge-repo
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
      - git: openclaw-claude-bridge-repo
      - file: /home/deploy/apps/openclaw-claude-bridge/.env
      - file: /etc/systemd/system/openclaw-claude-bridge.service
      - cmd: openclaw-claude-bridge-install
    - require:
      - service: openclaw-claude-bridge-service-enabled
      - cmd: openclaw-claude-bridge-systemd-daemon-reload
