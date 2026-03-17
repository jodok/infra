{%- if grains['os'] == 'Ubuntu' %}
/etc/apt/keyrings:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

/etc/apt/keyrings/nodesource.asc:
  file.managed:
    - source: https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key
    - require:
      - file: /etc/apt/keyrings

/etc/apt/sources.list.d/nodesource.sources:
  file.managed:
    - contents: |
        Types: deb
        URIs: https://deb.nodesource.com/node_24.x
        Suites: nodistro
        Components: main
        Signed-By: /etc/apt/keyrings/nodesource.asc
    - require:
      - file: /etc/apt/keyrings/nodesource.asc

nodejs:
  pkg.installed:
    - refresh: True
    - require:
      - file: /etc/apt/sources.list.d/nodesource.sources
{%- endif %}
