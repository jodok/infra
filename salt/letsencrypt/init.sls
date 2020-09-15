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

{%- if salt['pillar['letsencrypt']['mode'] == 'standalone' %}
  {%- set letsencrypt_mode = '--standalone' %}
{%- else %}
  {%- set letsencrypt_mode = '--webroot -w /var/lib/letsencrypt/' %}
{%- endif %}

{%- for cert, domains in salt['pillar.get']('letsencrypt:certs', {}).items() %}
/etc/letsencrypt/live/{{ cert }}/fullchain.pem:
  cmd.run:
  - name: /bin/certbot certonly -n --agree-tos --expand -m jodok@batlogg.com {{ letsencrypt_mode }} -d {{ cert }}{%- for domain in domains %} -d {{ domain }}{%- endfor %}
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

/etc/sysconfig/certbot:
  file.managed:
  - source: salt://letsencrypt/certbot.sysconfig.j2
  - template: jina

certbot-renew.timer:
  service.enabled: []
