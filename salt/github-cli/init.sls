{%- if grains['os'] == 'Ubuntu' %}
/etc/apt/keyrings:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

/etc/apt/keyrings/githubcli-archive-keyring.gpg:
  file.managed:
    - source: https://cli.github.com/packages/githubcli-archive-keyring.gpg
    - require:
      - file: /etc/apt/keyrings

/etc/apt/sources.list.d/github-cli.list:
  file.managed:
    - contents: |
        deb [signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main
    - require:
      - file: /etc/apt/keyrings/githubcli-archive-keyring.gpg

gh:
  pkg.installed:
    - refresh: True
    - require:
      - file: /etc/apt/sources.list.d/github-cli.list
{%- endif %}
