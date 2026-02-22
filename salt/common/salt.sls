salt-minion:
  service.dead:
    - enable: False

/srv:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

/srv/infra:
  file.directory:
    - user: deploy
    - group: infra
    - mode: "2775"
    - require:
      - file: /srv
      - user: deploy-user
      - group: infra

normalize-srv-infra-perms:
  cmd.run:
    - name: |
        chown -R deploy:infra /srv/infra
        chmod -R g+rwX /srv/infra
        find /srv/infra -type d -exec chmod g+s {} +
        git -C /srv/infra config core.sharedRepository group
    - onlyif: test -d /srv/infra/.git
    - require:
      - file: /srv/infra

deploy-safe-directory-srv-infra:
  cmd.run:
    - name: git config --global --add safe.directory /srv/infra
    - runas: deploy
    - unless: git config --global --get-all safe.directory | grep -Fx '/srv/infra'
    - require:
      - user: deploy-user
      - file: /srv/infra
