letsencrypt:
  mode: nginx
  certs:
    bertone.batlogg.com:
    - batlogg.com
    - www.batlogg.com
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service
