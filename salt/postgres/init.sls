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
