/home/admin/sandbox:
  file.directory:
    - user: admin
    - group: admin
    - mode: "0775"

/etc/sudoers.d:
  file.directory:
    - user: root
    - group: root
    - mode: "0750"
