# Allow Docker containers to connect to PostgreSQL via the Docker bridge network.
# The docker0 bridge typically uses 172.17.0.0/16.

postgres-docker-hba:
  cmd.run:
    - name: |
        PG_HBA=$(sudo -u postgres psql -tAc "SHOW hba_file")
        if ! grep -q 'docker containers' "$PG_HBA"; then
          echo '# docker containers' >> "$PG_HBA"
          echo 'host    all    all    172.16.0.0/12    md5' >> "$PG_HBA"
        fi
    - require:
      - service: postgresql-service
    - unless: |
        PG_HBA=$(sudo -u postgres psql -tAc "SHOW hba_file")
        grep -q 'docker containers' "$PG_HBA"

postgres-listen-addresses:
  cmd.run:
    - name: |
        PG_CONF=$(sudo -u postgres psql -tAc "SHOW config_file")
        if ! grep -q "^listen_addresses.*172.17.0.1" "$PG_CONF"; then
          sed -i "s/^#*listen_addresses.*/listen_addresses = 'localhost,172.17.0.1'/" "$PG_CONF"
        fi
    - require:
      - service: postgresql-service
    - unless: |
        PG_CONF=$(sudo -u postgres psql -tAc "SHOW config_file")
        grep -q "^listen_addresses.*172.17.0.1" "$PG_CONF"

postgres-restart-for-docker:
  cmd.run:
    - name: systemctl restart postgresql
    - onchanges:
      - cmd: postgres-docker-hba
      - cmd: postgres-listen-addresses
