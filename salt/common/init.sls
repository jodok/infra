include:
  - common.sudoers
  - common.sshd
  - common.fail2ban
{% if grains['os'] == 'CentOS' %}
  - common.centos
{% endif %}

root:
  alias.present:
    - target: jodok@batlogg.com
