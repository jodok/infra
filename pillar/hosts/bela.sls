letsencrypt:
  mode: standalone
  certs:
    bela.batlogg.com:
    - mx2.batlogg.com
  deploy_hooks:
  - /bin/systemctl try-restart exim.service
