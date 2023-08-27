{% if grains['os'] == 'CentOS' %}
commom_pkgs:
  pkg.installed:
  - pkgs:
    - tar
    - git
    - wget
    - telnet

admin:
  user.present:
  - groups:
    - wheel
  ssh_auth.present:
  - name: AAAAB3NzaC1yc2EAAAADAQABAAABAQCklkTcGXm7RSadXDulh3dR0QLA0KymDzRhEhvvnyjRnzdEWmfgPfN05C9qDQZXzoL64NY8BuTVFMjLfWYC9+tesWMemJYCDV9ATwhFRZxru20+eBwFn9wLCLv7sozy72jIrWROvjoP5nG8D2/2Yzv07t/qPC7BDDOSp3gYJcyLLeIIqBfrZ6pmkM18V6rNDeRTz11EN5+mLRr6+AwHcBE8iv5+Ea1baMFTbvLx9NAPA3+IoPYSBiwfTCbFQKxkXMc7Fg31NG+iHrtj3dVsfGOq46ecla/FqdWudMlwScwV34MncZzNzVAxgN6TMUJtOIRl/OVox5oD2dFwVprjKHWH jodok@batlogg.com
  - user: admin
  - enc: ssh-rsa

crond:
  service.enabled: []

{% elif grains['os'] == 'Ubuntu' %}

fail2ban:
  pkg.installed: []

{% endif %}

root:
  alias.present:
    - target: jodok@batlogg.com
