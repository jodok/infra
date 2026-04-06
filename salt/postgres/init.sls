postgresql:
  pkg.installed:
    - pkgs:
      - postgresql
      - postgresql-common

postgresql-pgvector:
  pkg.installed:
    - name: postgresql-16-pgvector
    - require:
      - pkg: postgresql

postgresql-service:
  service.enabled:
    - name: postgresql
    - require:
      - pkg: postgresql

# Allow connections from Docker bridge networks (172.16.0.0/12)
postgres-docker-hba:
  cmd.run:
    - name: |
        PG_HBA=$(sudo -u postgres psql -tAc "SHOW hba_file")
        if ! grep -q 'docker containers' "$PG_HBA"; then
          echo '# docker containers' >> "$PG_HBA"
          echo 'host    all             all             172.16.0.0/12           scram-sha-256' >> "$PG_HBA"
        fi
    - require:
      - service: postgresql-service
    - unless: |
        PG_HBA=$(sudo -u postgres psql -tAc "SHOW hba_file")
        grep -q 'docker containers' "$PG_HBA"

postgres-listen-all:
  cmd.run:
    - name: |
        PG_CONF=$(sudo -u postgres psql -tAc "SHOW config_file")
        sed -i "s/^#*listen_addresses.*/listen_addresses = '*'/" "$PG_CONF"
    - require:
      - service: postgresql-service
    - unless: |
        PG_CONF=$(sudo -u postgres psql -tAc "SHOW config_file")
        grep -q "^listen_addresses = '\*'" "$PG_CONF"

postgres-restart:
  cmd.run:
    - name: systemctl restart postgresql
    - onchanges:
      - cmd: postgres-docker-hba
      - cmd: postgres-listen-all
