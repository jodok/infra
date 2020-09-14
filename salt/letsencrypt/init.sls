certbot:
  pkg.installed: []

letsencrypt:
  group.present:
  - system: true

/etc/letsencrypt/archive:
  file.directory:
  - dir_mode: "0750"
  - user: root
  - group: letsencrypt

/etc/letsencrypt/live:
  file.directory:
  - dir_mode: "0750"
  - user: root
  - group: letsencrypt
