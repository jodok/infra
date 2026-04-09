{%- if grains['os'] == 'Ubuntu' %}
github-cli-apt-keyrings-dir:
  file.directory:
    - name: /etc/apt/keyrings
    - user: root
    - group: root
    - mode: "0755"

github-cli-archive-keyring:
  file.managed:
    - name: /etc/apt/keyrings/githubcli-archive-keyring.gpg
    - source: https://cli.github.com/packages/githubcli-archive-keyring.gpg
    - require:
      - file: github-cli-apt-keyrings-dir

github-cli-apt-source:
  file.managed:
    - name: /etc/apt/sources.list.d/github-cli.list
    - contents: |
        deb [signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main
    - require:
      - file: github-cli-archive-keyring

github-cli-package:
  pkg.installed:
    - name: gh
    - refresh: True
    - require:
      - file: github-cli-apt-source
{%- endif %}
