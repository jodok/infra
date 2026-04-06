# Create the honcho PostgreSQL database, user, and pgvector extension.

honcho-db-user:
  postgres_user.present:
    - name: honcho
    - password: "{{ salt['pillar.get']('secrets:vault:honcho:db_password') }}"
    - login: True
    - refresh_password: True
    - require:
      - service: postgresql-service

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
