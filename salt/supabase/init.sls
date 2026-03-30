include:
  - docker
  - nodejs

/srv/supabase:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

supabase-cli:
  cmd.run:
    - name: npm install -g supabase
    - unless: command -v supabase >/dev/null 2>&1
    - require:
      - file: /srv/supabase
