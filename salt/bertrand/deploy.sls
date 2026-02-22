/var/www/html:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: "2775"
    - makedirs: True

deploy-www-data-group-membership:
  user.present:
    - name: deploy
    - optional_groups:
      - www-data

{% for site in ['namche.ai', 'www.namche.ai', 'api.namche.ai', 'nima.namche.ai', 'pema.namche.ai', 'tashi.namche.ai'] %}
/var/www/html/{{ site }}:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: "2775"
    - makedirs: True
    - require:
      - file: /var/www/html
      - user: deploy-www-data-group-membership
{% endfor %}
