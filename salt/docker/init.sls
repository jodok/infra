{%- if grains['os'] == 'CentOS' %}
docker-ce:
  pkg.installed:
  - sources:
    - docker-ce: https://download.docker.com/linux/centos/docker-ce.repo
{%- endif %}

{%- if grains['os'] == 'Ubuntu' %}
/etc/apt/keyrings/docker.asc:
  file.managed:
    - name: 
    - source: https://download.docker.com/linux/ubuntu/gpg
    - makedirs: True

/etc/apt/sources.list.d/docker.sources:
  file.managed:
    - contents: |
        Types: deb
        URIs: https://download.docker.com/linux/ubuntu
        Suites: {{ grains['oscodename'] }}
        Components: stable
        Signed-By: /etc/apt/keyrings/docker.asc
    - require:
      - file: /etc/apt/keyrings/docker.asc

docker:
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
      - docker-buildx-plugin
      - docker-compose-plugin
    - refresh: True
    - require:
      - file: /etc/apt/sources.list.d/docker.sources
  {%- endif %}