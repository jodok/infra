infra:
  group.present: []

deploy:
  user.present:
    - shell: /bin/bash
    - home: /home/deploy
    - createhome: True

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

admin-infra-group-membership:
  user.present:
    - name: admin
    - optional_groups:
      - infra
    - require:
      - group: infra

deploy-infra-group-membership:
  user.present:
    - name: deploy
    - optional_groups:
      - infra
    - require:
      - user: deploy
      - group: infra
