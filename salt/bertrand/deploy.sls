/var/www/html:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: "2775"
    - makedirs: True

{% for site in ['namche.ai', 'www.namche.ai', 'api.namche.ai', 'nima.namche.ai', 'pema.namche.ai', 'tashi.namche.ai'] %}
/var/www/html/{{ site }}:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: "2775"
    - makedirs: True
    - require:
      - file: /var/www/html
{% endfor %}
