letsencrypt:
  mode: dns-cloudflare
  dns_cloudflare_credentials_pillar: secrets:vault:cloudflare:dns_api_tokens:namche.ai
  certs:
    khumbu.namche.ai:
    - '*.khumbu.namche.ai'
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service

openclaw:
  claude_bridge:
    repo: https://github.com/shinglokto/openclaw-claude-bridge.git
    rev: c828f45bfc7a8690487a1b06d0dec591b9857fcf
    api_port: 3456
    status_port: 3458
