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
      - user: deploy
      - group: infra

normalize-srv-infra-perms:
  cmd.run:
    - name: |
        changed=0

        if find /srv/infra \( ! -user deploy -o ! -group infra \) -print -quit | grep -q .; then
          changed=1
        fi

        if find /srv/infra -type d \( ! -perm -2000 -o ! -perm -0770 \) -print -quit | grep -q .; then
          changed=1
        fi

        if find /srv/infra -type f ! -perm -0060 -print -quit | grep -q .; then
          changed=1
        fi

        if find /srv/infra -type f -perm -u=x ! -perm -g=x -print -quit | grep -q .; then
          changed=1
        fi

        if git -C /srv/infra rev-parse --is-inside-work-tree >/dev/null 2>&1; then
          current="$(git -C /srv/infra config --get core.sharedRepository || true)"
          if [ "$current" != "group" ]; then
            changed=1
          fi
        fi

        if [ "$changed" -eq 0 ]; then
          echo "changed=no comment='/srv/infra permissions already normalized'"
          exit 0
        fi

        chown -R deploy:infra /srv/infra
        chmod -R g+rwX /srv/infra
        find /srv/infra -type d -exec chmod g+s {} +
        if git -C /srv/infra rev-parse --is-inside-work-tree >/dev/null 2>&1; then
          git -C /srv/infra config core.sharedRepository group
        fi
        echo "changed=yes comment='normalized /srv/infra permissions'"
    - stateful: True
    - onlyif: test -d /srv/infra
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
