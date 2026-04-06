# Create the honcho PostgreSQL database, user, and pgvector extension.

honcho-db-user:
  postgres_user.present:
    - name: honcho
    - password: {{ salt['pillar.get']('secrets:vault:honcho:db_password') }}
    - login: True
    - require:
      - service: postgresql-service

honcho-db:
  postgres_database.present:
    - name: honcho
    - owner: honcho
    - require:
      - postgres_user: honcho-db-user

honcho-db-pgvector:
  cmd.run:
    - name: sudo -u postgres psql -d honcho -c "CREATE EXTENSION IF NOT EXISTS vector;"
    - require:
      - postgres_database: honcho-db
      - pkg: postgresql-pgvector
    - unless: sudo -u postgres psql -d honcho -tAc "SELECT 1 FROM pg_extension WHERE extname='vector'" | grep -q 1
