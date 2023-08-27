{%- if grains['os'] == 'CentOS' %}

docker-ce:
  pkg.installed:
  - sources:
    - docker-ce: https://download.docker.com/linux/centos/docker-ce.repo

{%- endif %}

docker:
  service.enabled: []
