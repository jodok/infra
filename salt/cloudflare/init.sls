/etc/nginx/certs:
  file.directory:
  - user: root
  - group: root
  - dir_mode: "0750"

/etc/nginx/certs/namche.ai.cloudflare-origin.crt:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://bertrand/origin_cert_namche.pem
  - require:
    - file: /etc/nginx/certs

/etc/nginx/certs/cloudflare-origin-ca-rsa-root.pem:
  file.managed:
  - user: root
  - group: root
  - mode: "0644"
  - source: salt://cloudflare/origin_ca_rsa_root.pem
  - require:
    - file: /etc/nginx/certs

/etc/nginx/certs/namche.ai.cloudflare-origin.key:
  file.managed:
  - user: root
  - group: root
  - mode: "0600"
  - contents_pillar: secrets:vault:cloudflare-origin-certificates:namche:key
  - show_changes: false
  - require:
    - file: /etc/nginx/certs
