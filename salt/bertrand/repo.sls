infra:
  group.present: []

bertrand-repo-admin-group-membership:
  user.present:
    - name: admin
    - optional_groups:
      - infra

bertrand-repo-deploy-group-membership:
  user.present:
    - name: deploy
    - optional_groups:
      - infra

/srv:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

/srv/infra:
  file.directory:
    - user: admin
    - group: infra
    - mode: "2775"
    - require:
      - file: /srv

normalize-bertrand-infra-perms:
  cmd.run:
    - name: |
        chown -R admin:infra /srv/infra
        chgrp -R infra /srv/infra
        chmod -R g+rwX /srv/infra
        find /srv/infra -type d -exec chmod g+s {} +
        git -C /srv/infra config core.sharedRepository group
    - onlyif: test -d /srv/infra/.git
    - require:
      - file: /srv/infra

admin-safe-directory-infra:
  cmd.run:
    - name: git config --global --add safe.directory /srv/infra
    - runas: admin
    - unless: git config --global --get-all safe.directory | grep -Fx '/srv/infra'
    - require:
      - user: bertrand-repo-admin-group-membership
      - file: /srv/infra

deploy-safe-directory-infra:
  cmd.run:
    - name: git config --global --add safe.directory /srv/infra
    - runas: deploy
    - unless: git config --global --get-all safe.directory | grep -Fx '/srv/infra'
    - require:
      - user: bertrand-repo-deploy-group-membership
      - file: /srv/infra
