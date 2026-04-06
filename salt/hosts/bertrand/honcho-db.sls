# Create the honcho PostgreSQL database, user, and pgvector extension.

honcho-db-user:
  postgres_user.present:
    - name: honcho
    - login: True
    - require:
      - service: postgresql-service

honcho-db-user-password:
  cmd.run:
    - name: sudo -u postgres psql -c "ALTER ROLE honcho WITH PASSWORD '{{ salt['pillar.get']('secrets:vault:honcho:db_password') | trim }}';"
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
