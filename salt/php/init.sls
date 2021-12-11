{%- if grains['os'] == 'CentOS' %}

remi-release-8:
  pkg.installed:
  - sources:
    - remi-release: http://rpms.remirepo.net/enterprise/remi-release-8.rpm
remi-7.4:
  cmd.run:
  - name: module reset php && dnf module enable php:remi-7.4
  - unless: dnf module list --enabled php | grep "remi-7\.4"

{%- elif grains['os'] == 'Ubuntu' %}

ondrej-php-ppa:
  pkgrepo.managed:
  - ppa: ondrej/php
ondrej-nginx-ppa:
  pkgrepo.managed:
  - ppa: ondrej/nginx

{%- endif %}

php:
  pkg.installed:
  - pkgs:
    - php
    - php-fpm
    - php-gd
    {%- if grains['os'] == 'CentOS' %}
    - php-mysqlnd
    - php-pecl-zip
    - php-pecl-imagick
    {%- elif grains['os'] == 'Ubuntu' %}
    - php-mysql
    - php-zip
    - php-imagick
    {%- endif %}

php-fpm:
  service.enabled: []

{%- if grains['os'] == 'CentOS' %}

/etc/php-fpm.d/www.conf:
  file.managed:
  - source: salt://php/php-fpm.conf
php-fpm-reload:
  cmd.run:
  - name: systemctl try-restart php-fpm
  - onchanges:
    - file: /etc/php-fpm.d/www.conf

{%- elif grains['os'] == 'Ubuntu' %}

{%- endif %}
