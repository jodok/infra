/etc/ssh/sshd_config:
  file.replace:
    - pattern: '^(#\\s*)?PermitRootLogin\\s+.*$'
    - repl: 'PermitRootLogin no'
    - append_if_not_found: True
    - backup: True

ssh:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config
