ssh:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.replace:
    - pattern: '^#?\s*PermitRootLogin\b.*$'
    - repl: 'PermitRootLogin no'
    - append_if_not_found: True
    - backup: True
