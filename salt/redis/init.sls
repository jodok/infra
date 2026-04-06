redis-server:
  pkg.installed: []

redis-service:
  service.enabled:
    - name: redis-server
    - require:
      - pkg: redis-server
