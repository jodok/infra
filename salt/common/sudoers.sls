/etc/sudoers:
  file.replace:
    - pattern: '^%sudo\\s+ALL=\\(ALL:ALL\\)\\s+ALL$'
    - repl: '%sudo ALL=(ALL:ALL) NOPASSWD:ALL'
    - append_if_not_found: True
    - backup: True
