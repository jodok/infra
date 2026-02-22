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
    - dir_mode: "2775"
    - file_mode: "0664"
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /srv
      - user: deploy
      - group: infra

srv-infra-shared-repository-group:
  cmd.run:
    - name: git -C /srv/infra config core.sharedRepository group
    - onlyif: git -C /srv/infra rev-parse --is-inside-work-tree >/dev/null 2>&1
    - unless: test "$(git -C /srv/infra config --get core.sharedRepository || true)" = "group"
    - require:
      - file: /srv/infra

deploy-safe-directory-srv-infra:
  cmd.run:
    - name: git config --global --add safe.directory /srv/infra
    - runas: deploy
    - unless: git config --global --get-all safe.directory | grep -Fx '/srv/infra'
    - require:
      - user: deploy
      - file: /srv/infra
