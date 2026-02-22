infra:
  group.present: []

deploy:
  user.present:
    - shell: /bin/bash
    - home: /home/deploy
    - optional_groups:
      - infra
      - www-data
    - createhome: True
    - require:
      - group: infra

/home/deploy/.ssh:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: "0700"
    - require:
      - user: deploy

/home/deploy/.ssh/authorized_keys:
  file.managed:
    - user: deploy
    - group: deploy
    - mode: "0600"
    - contents: |
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMiV0qz927RXGyqvUb0mCUwRGMuPnLkW7qO+y3cHW/Fl deploy@namche.ai
    - require:
      - file: /home/deploy/.ssh

/etc/sudoers.d/deploy-salt-call:
  file.managed:
    - user: root
    - group: root
    - mode: "0440"
    - contents: |
        deploy ALL=(root) NOPASSWD: /usr/bin/salt-call, /opt/saltstack/salt/bin/salt-call
    - check_cmd: /usr/sbin/visudo -cf
    - require:
      - file: /etc/sudoers.d
