redis-server:
  pkg.installed: []

redis-service:
  service.enabled:
    - name: redis-server
    - require:
      - pkg: redis-server

# Bind Redis to Docker bridge so containers can connect
redis-bind-docker:
  cmd.run:
    - name: |
        REDIS_CONF=/etc/redis/redis.conf
        sed -i 's/^bind 127.0.0.1.*/bind 127.0.0.1 172.17.0.1/' "$REDIS_CONF"
    - require:
      - service: redis-service
    - unless: grep -q '172.17.0.1' /etc/redis/redis.conf

redis-protected-mode:
  cmd.run:
    - name: sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf
    - require:
      - service: redis-service
    - unless: grep -q '^protected-mode no' /etc/redis/redis.conf

redis-restart:
  cmd.run:
    - name: systemctl restart redis-server
    - onchanges:
      - cmd: redis-bind-docker
      - cmd: redis-protected-mode
