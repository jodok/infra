# Create the honcho PostgreSQL database, user, and pgvector extension.

honcho-db-user:
  postgres_user.present:
    - name: honcho
    - login: True
    - require:
      - service: postgresql-service

# Set password via ALTER ROLE so PostgreSQL hashes it with scram-sha-256.
# Salt's postgres_user.present pre-hashes as md5, which is incompatible
# with scram-sha-256 auth in pg_hba.conf.
honcho-db-password:
  cmd.run:
    - name: sudo -u postgres psql -c "ALTER ROLE honcho WITH PASSWORD '{{ salt['pillar.get']('secrets:vault:honcho:db_password') | trim }}';"
    - unless: PGPASSWORD='{{ salt['pillar.get']('secrets:vault:honcho:db_password') | trim }}' psql -h localhost -U honcho -d postgres -tAc 'SELECT 1' 2>/dev/null | grep -q 1
    - require:
      - postgres_user: honcho-db-user

honcho-db:
  postgres_database.present:
    - name: honcho
    - owner: honcho
    - require:
      - postgres_user: honcho-db-user

honcho-db-pgvector:
  postgres_extension.present:
    - name: vector
    - maintenance_db: honcho
    - require:
      - postgres_database: honcho-db
      - pkg: postgresql-pgvector
