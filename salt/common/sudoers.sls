/etc/sudoers:
  file.replace:
    - pattern: '^#?%sudo\b.*$'
    - repl: "%sudo\tALL=(ALL:ALL) NOPASSWD:ALL"
    - append_if_not_found: True
