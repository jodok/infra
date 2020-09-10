letsencrypt:
  certs:
    bela.batlogg.com:
    - mx2.batlogg.com
  post_hooks:
  - /bin/systemctl try-restart exim.service
