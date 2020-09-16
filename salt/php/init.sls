remi-release-8:
  pkg.installed:
  - sources:
    - remi-release: http://rpms.remirepo.net/enterprise/remi-release-8.rpm

remi-7.4:
  cmd.run:
  - name: module reset php && dnf module enable php:remi-7.4
  - unless: dnf module list --enabled php | grep "remi-7\.4"

php:
  pkg.installed:
  - pkgs:
    - php
    - php-fpm
    - php-gd
    - php-mysqlnd

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
