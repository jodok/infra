# Automatic security updates via Steve Meier's Updateinfo yum repository
# https://updateinfo.cefs.steve-meier.de/
# Sign up with patreon to get security infos: https://www.patreon.com/stevemeier
# you need to add the credentials to salt-pillar
updates-cefs:
  pkgrepo.managed:
    - humanname: CentOS-$releasever - Updates (from CEFS)
    - baseurl: https://{{ pillar['secrets']['vault']['cefs'] }}@updateinfo.cefs.steve-meier.de/$releasever/updates/$basearch/
    - gpgcheck: 1
dnf-automatic:
  pkg.installed: []
  file.managed:
  - name: /etc/dnf/automatic.conf
  - source: salt://common/automatic.conf

git:
  pkg.installed: []

wget:
  pkg.installed: []

admin:
  user.present:
  - groups:
    - wheel
  ssh_auth.present:
  - name: AAAAB3NzaC1yc2EAAAADAQABAAABAQCklkTcGXm7RSadXDulh3dR0QLA0KymDzRhEhvvnyjRnzdEWmfgPfN05C9qDQZXzoL64NY8BuTVFMjLfWYC9+tesWMemJYCDV9ATwhFRZxru20+eBwFn9wLCLv7sozy72jIrWROvjoP5nG8D2/2Yzv07t/qPC7BDDOSp3gYJcyLLeIIqBfrZ6pmkM18V6rNDeRTz11EN5+mLRr6+AwHcBE8iv5+Ea1baMFTbvLx9NAPA3+IoPYSBiwfTCbFQKxkXMc7Fg31NG+iHrtj3dVsfGOq46ecla/FqdWudMlwScwV34MncZzNzVAxgN6TMUJtOIRl/OVox5oD2dFwVprjKHWH
  - user: admin
  - enc: ssh-rsa

root:
  alias.present:
    - target: jodok@batlogg.com

crond:
  service.enabled: []
