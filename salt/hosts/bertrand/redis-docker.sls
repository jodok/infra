# Allow Docker containers to connect to Redis via the Docker bridge network.

redis-bind-docker:
  cmd.run:
    - name: |
        REDIS_CONF=/etc/redis/redis.conf
        if ! grep -q '172.17.0.1' "$REDIS_CONF"; then
          sed -i 's/^bind 127.0.0.1/bind 127.0.0.1 172.17.0.1/' "$REDIS_CONF"
        fi
    - require:
      - service: redis-service
    - unless: grep -q '172.17.0.1' /etc/redis/redis.conf

redis-protected-mode:
  cmd.run:
    - name: |
        REDIS_CONF=/etc/redis/redis.conf
        sed -i 's/^protected-mode yes/protected-mode no/' "$REDIS_CONF"
    - require:
      - service: redis-service
    - unless: grep -q '^protected-mode no' /etc/redis/redis.conf

redis-restart-for-docker:
  cmd.run:
    - name: systemctl restart redis-server
    - onchanges:
      - cmd: redis-bind-docker
      - cmd: redis-protected-mode
