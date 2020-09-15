letsencrypt:
  mode: standalone
  certs:
    bartok.batlogg.com:
    - mx1.batlogg.com
    - imap.batlogg.com
    - smtp.batlogg.com
  deploy_hooks:
  - /bin/systemctl try-restart exim.service
  - /bin/systemctl try-restart dovecot.service
