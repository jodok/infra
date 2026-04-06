letsencrypt:
  mode: dns-cloudflare
  dns_cloudflare_credentials_pillar: secrets:vault:cloudflare:dns_api_tokens:namche.ai
  certs:
    khumbu.namche.ai:
    - '*.khumbu.namche.ai'
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service
