/home/admin/.openclaw:
  file.directory:
    - user: 1000
    - group: 1000
    - mode: "0775"

/home/admin/.openclaw/workspace:
  file.directory:
    - user: 1000
    - group: 1000
    - mode: "0775"
    - require:
      - file: /home/admin/.openclaw
