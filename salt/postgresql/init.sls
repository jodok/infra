postgresql:
  pkg.installed: []
  service.running:
    - enable: True

{% for version in ['17', '16', '15', '14'] %}
/etc/postgresql/{{ version }}/main/pg_hba.conf-docker-access:
  file.replace:
    - name: /etc/postgresql/{{ version }}/main/pg_hba.conf
    - pattern: '^host\s+all\s+all\s+172\.17\.0\.0/16\s+scram-sha-256$'
    - repl: 'host    all             all             172.17.0.0/16          scram-sha-256'
    - append_if_not_found: True
    - onlyif: test -f /etc/postgresql/{{ version }}/main/pg_hba.conf
    - require:
      - pkg: postgresql
    - watch_in:
      - service: postgresql
{% endfor %}
