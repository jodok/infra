include:
  - docker

git:
  pkg.installed: []

/srv/supabase:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"
    - require:
      - pkg: git
