include:
- letsencrypt
- nginx
- nginx.letsencrypt

/etc/nginx/conf.d/bertone.batlogg.com.conf:
  file.managed:
  - source: salt://bertone/bertone.batlogg.com.conf
