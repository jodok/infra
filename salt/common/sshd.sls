# newer Ubuntu versions use sshd.socket, disable it
sshd.socket:
    service.dead:
    - enable: False

# use ssh service instead
ssh:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config-permit-root-login:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: '^#?PermitRootLogin\b.*$'
    - repl: 'PermitRootLogin no'
    - append_if_not_found: True

/etc/ssh/sshd_config-password-auth:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: '^#?PasswordAuthentication\b.*$'
    - repl: 'PasswordAuthentication no'
    - append_if_not_found: True