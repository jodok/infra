# Create the paperclip PostgreSQL database and user.

paperclip-db-user:
  postgres_user.present:
    - name: paperclip
    - password: "{{ salt['pillar.get']('secrets:vault:paperclip:db_password') | trim }}"
    - encrypted: scram-sha-256
    - login: True
    - require:
      - service: postgresql-service

paperclip-db:
  postgres_database.present:
    - name: paperclip
    - owner: paperclip
    - require:
      - postgres_user: paperclip-db-user
