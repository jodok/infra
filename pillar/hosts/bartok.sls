letsencrypt:
  certs:
    bartok.batlogg.com:
    - mx1.batlogg.com
    - imap.batlogg.com
    - smtp.batlogg.com
  post_hooks:
  - /bin/systemctl try-restart exim.service
  - /bin/systemctl try-restart dovecot.service
