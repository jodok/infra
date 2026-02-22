letsencrypt:
  mode: nginx
  certs:
    namche.ai:
    - api.namche.ai
    - nima.namche.ai
    - pema.namche.ai
    - tashi.namche.ai
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service
