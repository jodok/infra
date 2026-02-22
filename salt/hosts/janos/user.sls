aileen:
  user.present:
  - shell: /bin/nologin
  file.managed:
  - name: /home/aileen/.forward
  - contents: aileen@gsuite.batlogg.com
  - user: aileen
  - group: aileen

archive:
  user.present:
  - shell: /bin/nologin

aurelia:
  user.present:
  - shell: /bin/nologin
  file.managed:
  - name: /home/aurelia/.forward
  - contents: aurelia@gsuite.batlogg.com
  - user: aurelia
  - group: aurelia

familie:
  alias.present:
    - target: jodok, manuela

fiona:
  user.present:
  - shell: /bin/nologin
  file.managed:
  - name: /home/fiona/.forward
  - contents: fiona@gsuite.batlogg.com
  - user: fiona
  - group: fiona

helmut:
  user.present:
  - shell: /bin/nologin
  file.managed:
  - name: /home/helmut/.forward
  - contents: helmut@gsuite.batlogg.com
  - user: helmut
  - group: helmut

jodok:
  user.present:
  - shell: /bin/nologin
  file.absent:
  - name: /home/jodok/.forward
  #- source: salt://spamassassin/.forward
  #- user: jodok
  #- group: jodok

manuela:
  user.present:
  - shell: /bin/nologin
  file.managed:
  - name: /home/manuela/.forward
  - contents: manuela@gsuite.batlogg.com
  - user: manuela
  - group: manuela

veronika:
  alias.present:
    - target: helmut
