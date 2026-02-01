fail2ban:
  pkg.installed: []
  service.running:
    - name: fail2ban
    - enable: True
    - watch:
      - file: /etc/fail2ban/jail.local

/etc/fail2ban/jail.local:
  file.managed:
    - contents: |
        [sshd]
        enabled = true
        maxretry = 5
        findtime = 10m
        bantime = 1h
    - user: root
    - group: root
    - mode: '0644'
