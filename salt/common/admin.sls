/home/admin/sandbox:
  file.directory:
    - user: admin
    - group: admin
    - mode: "0775"

tashi:
  user.present:
    - shell: /bin/bash
    - home: /home/tashi
    - createhome: True

/home/tashi/.ssh:
  file.directory:
    - user: tashi
    - group: tashi
    - mode: "0700"
    - require:
      - user: tashi

/home/tashi/.ssh/authorized_keys:
  file.managed:
    - user: tashi
    - group: tashi
    - mode: "0600"
    - contents: |
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTqdskP8o1MPc2tGkXM8VwshE1BeyzRH0vdLSwn/POs tashi@batlogg.com
    - require:
      - file: /home/tashi/.ssh

/etc/sudoers.d:
  file.directory:
    - user: root
    - group: root
    - mode: "0750"
