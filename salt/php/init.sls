{%- if grains['os'] == 'CentOS' %}

remi-release-9:
  pkg.installed:
  - sources:
    - remi-release: https://rpms.remirepo.net/enterprise/remi-release-9.rpm
remi-7.4:
  cmd.run:
  - name: module reset php && dnf module enable php:remi-8.2
  - unless: dnf module list --enabled php | grep "remi-8\.2"

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
    - php-intl
    {%- if grains['os'] == 'CentOS' %}
    - php-mysqlnd
    - php-pecl-zip
    - php-pecl-imagick
    {%- elif grains['os'] == 'Ubuntu' %}
    - php-mysql
    - php-zip
    - php-imagick
    {%- endif %}


{%- if grains['os'] == 'CentOS' %}

php-fpm:
  service.enabled: []

/etc/php-fpm.d/www.conf:
  file.managed:
  - source: salt://php/php-fpm.conf
php-fpm-reload:
  cmd.run:
  - name: systemctl try-restart php-fpm
  - onchanges:
    - file: /etc/php-fpm.d/www.conf

{%- elif grains['os'] == 'Ubuntu' %}

php8.0-fpm:
  service.enabled: []

{%- endif %}
