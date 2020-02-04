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

{%- for cert, domains in salt['pillar.get']('letsencrypt:certs', {}).items() %}
/etc/letsencrypt/live/{{ cert }}/fullchain.pem:
  cmd.run:
  - name: /bin/certbot certonly -n --agree-tos --expand -m sysadmin@crate.io --standalone -d {{ cert }}{%- for domain in domains %} -d {{ domain }}{%- endfor %}
  - unless: test -e /etc/letsencrypt/live/{{ cert }}/fullchain.pem

/etc/letsencrypt/archive/{{ cert }}:
  file.directory:
  - dir_mode: "0750"
  - user: root
  - group: letsencrypt

/etc/letsencrypt/live/{{ cert }}:
  file.directory:
  - dir_mode: "0750"
  - user: root
  - group: letsencrypt
{%- endfor %}

certbot_cron:
  cron.present:
  - name: /bin/certbot renew -q {%- for post_hook in salt['pillar.get']('letsencrypt:post_hooks', []) %} --post-hook '{{ post_hook }}'{%- endfor %}
  - user: root
  - hour: 0,12
  - minute: 0
