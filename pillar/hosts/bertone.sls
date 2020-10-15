letsencrypt:
  mode: nginx
  certs:
    bertone.batlogg.com:
    - batlogg.com
    - www.batlogg.com
    nr.gy:
    - www.nr.gy
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service
