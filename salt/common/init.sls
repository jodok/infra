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

root:
  alias.present:
    - target: jodok@batlogg.com

crond:
  service.enabled: []
