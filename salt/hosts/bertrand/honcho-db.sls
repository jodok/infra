# Create the honcho PostgreSQL database and user.
# Runs as the postgres system user so it can use peer authentication.

honcho-db-user:
  cmd.run:
    - name: >
        sudo -u postgres psql -tAc
        "SELECT 1 FROM pg_roles WHERE rolname='honcho'" |
        grep -q 1 ||
        sudo -u postgres psql -c
        "CREATE ROLE honcho WITH LOGIN PASSWORD '{{ salt['pillar.get']('secrets:vault:honcho:db_password') }}';"
    - require:
      - service: postgresql-service
    - unless: sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='honcho'" | grep -q 1

honcho-db:
  cmd.run:
    - name: >
        sudo -u postgres psql -tAc
        "SELECT 1 FROM pg_database WHERE datname='honcho'" |
        grep -q 1 ||
        sudo -u postgres createdb -O honcho honcho
    - require:
      - cmd: honcho-db-user
    - unless: sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='honcho'" | grep -q 1

honcho-db-pgvector:
  cmd.run:
    - name: sudo -u postgres psql -d honcho -c "CREATE EXTENSION IF NOT EXISTS vector;"
    - require:
      - cmd: honcho-db
      - pkg: postgresql-pgvector
    - unless: sudo -u postgres psql -d honcho -tAc "SELECT 1 FROM pg_extension WHERE extname='vector'" | grep -q 1
