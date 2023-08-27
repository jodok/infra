nginx:
  pkg.installed: []
  service.enabled: []

/etc/nginx/proxy_params:
  file.managed:
    - source: salt://nginx/proxy_params
