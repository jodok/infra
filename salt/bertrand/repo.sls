infra:
  group.present: []

admin:
  user.present:
    - groups:
      - infra
    - append: True

tashi:
  user.present:
    - groups:
      - infra
    - append: True

/srv:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

move-bertrand-infra-checkout:
  cmd.run:
    - name: |
        if [ -d /home/admin/sandbox/infra/.git ] && [ ! -e /srv/infra/.git ]; then
          mv /home/admin/sandbox/infra /srv/infra
        fi
    - require:
      - file: /srv

/srv/infra:
  file.directory:
    - user: admin
    - group: infra
    - mode: "2775"
    - require:
      - cmd: move-bertrand-infra-checkout

normalize-bertrand-infra-perms:
  cmd.run:
    - name: |
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
      - file: /srv/infra

tashi-safe-directory-infra:
  cmd.run:
    - name: git config --global --add safe.directory /srv/infra
    - runas: tashi
    - unless: git config --global --get-all safe.directory | grep -Fx '/srv/infra'
    - require:
      - file: /srv/infra
