{%- set letsencrypt_mode_name = pillar['letsencrypt']['mode'] %}
{%- if letsencrypt_mode_name == 'dns-cloudflare' %}
  {%- set certbot_packages = ['certbot', 'python3-certbot-dns-cloudflare'] %}
{%- else %}
  {%- set certbot_packages = ['certbot'] %}
{%- endif %}

certbot:
  pkg.installed:
    - pkgs: {{ certbot_packages }}

{%- if grains['os_family'] == 'RedHat' %}
  {%- set certbot_config_path = '/etc/sysconfig/certbot' %}
{%- else %}
  {%- set certbot_config_path = '/etc/default/certbot' %}
{%- endif %}

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

/var/lib/letsencrypt/:
  file.directory:
  - dir_mode: "0750"
  - user: root
  - group: letsencrypt
  
{%- if letsencrypt_mode_name == 'standalone' %}
  {%- set letsencrypt_mode = '--standalone' %}
{%- elif letsencrypt_mode_name == 'dns-cloudflare' %}
  {%- set letsencrypt_mode = '--dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini' %}
{%- else %}
  {%- set letsencrypt_mode = '--webroot -w /var/lib/letsencrypt/' %}
{%- endif %}

{%- if letsencrypt_mode_name == 'dns-cloudflare' %}
/etc/letsencrypt/cloudflare.ini:
  file.managed:
  - user: root
  - group: root
  - mode: "0600"
  - contents_pillar: {{ pillar['letsencrypt']['dns_cloudflare_credentials_pillar'] }}
  - show_changes: false
{%- endif %}

{%- for cert, domains in salt['pillar.get']('letsencrypt:certs', {}).items() %}
/etc/letsencrypt/live/{{ cert }}/fullchain.pem:
  cmd.run:
  - name: /bin/certbot certonly -n --agree-tos --expand -m jodok@batlogg.com {{ letsencrypt_mode }} -d {{ cert }}{%- for domain in domains %} -d {{ domain }}{%- endfor %}
  - unless: test -e /etc/letsencrypt/live/{{ cert }}/fullchain.pem
  {%- if letsencrypt_mode_name == 'dns-cloudflare' %}
  - require:
    - file: /etc/letsencrypt/cloudflare.ini
  {%- endif %}

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

{{ certbot_config_path }}:
  file.managed:
  - source: salt://letsencrypt/certbot.sysconfig.j2
  - template: jinja

certbot.timer:
  service.enabled: []
