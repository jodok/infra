letsencrypt:
  mode: nginx
  certs:
    bertone.batlogg.com:
    - batlogg.com
    - www.batlogg.com
    nr.gy:
    - www.nr.gy
    happyswing.at:
    - happyswing.at
    - www.happyswing.at
    - node-red.happyswing.at
    - mqtt.happyswing.at
    - grafana.happyswing.at
  deploy_hooks:
  - /bin/systemctl try-restart nginx.service
