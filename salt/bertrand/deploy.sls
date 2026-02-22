
{% for site in ['namche.ai', 'www.namche.ai', 'api.namche.ai', 'nima.namche.ai', 'pema.namche.ai', 'tashi.namche.ai'] %}
/var/www/html/{{ site }}:
  file.directory:
    - user: deploy
    - group: www-data
    - dir_mode: "2755"
    - makedirs: True
    - require:
      - file: /var/www/html
{% endfor %}
