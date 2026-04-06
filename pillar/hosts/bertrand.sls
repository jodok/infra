letsencrypt:
  mode: dns-cloudflare
  dns_cloudflare_credentials_pillar: secrets:vault:cloudflare:dns_api_tokens:namche.ai
  certs:
    khumbu.namche.ai:
    - '*.khumbu.namche.ai'
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service

# Honcho configuration
# The following secrets must be added to pillar/secrets.sls (GPG-encrypted):
#   secrets:vault:honcho:db_password       - PostgreSQL password for the honcho user
#   secrets:vault:honcho:jwt_secret        - JWT secret for API authentication
#   secrets:vault:honcho:openai_api_key    - OpenAI API key (optional)
#   secrets:vault:honcho:anthropic_api_key - Anthropic API key (optional)
#   secrets:vault:honcho:gemini_api_key    - Google Gemini API key (optional)
#   secrets:vault:honcho:groq_api_key      - Groq API key (optional)
