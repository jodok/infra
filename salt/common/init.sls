include:
  - common.admin
  - common.bash
  - common.ghostty
  - common.sudoers
  - common.sshd
  - common.fail2ban
  - common.salt
{% if grains['os'] == 'CentOS' %}
  - common.centos
{% endif %}

root:
  alias.present:
    - target: jodok@batlogg.com
