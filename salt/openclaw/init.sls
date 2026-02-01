/mnt/data/openclaw:
  file.directory:
    - user: 1000
    - group: 1000
    - mode: "0755"
    - makedirs: True
    - require:
      - mount: /mnt/data

/mnt/data/openclaw/.openclaw:
  file.directory:
    - user: 1000
    - group: 1000
    - mode: "0755"
    - makedirs: True
    - require:
      - mount: /mnt/data/openclaw

/mnt/data/openclaw/.openclaw/workspace:
  file.directory:
    - user: 1000
    - group: 1000
    - mode: "0755"
    - makedirs: True
    - require:
      - mount: /mnt/data/openclaw/.openclaw
