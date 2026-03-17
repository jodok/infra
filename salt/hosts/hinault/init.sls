include:
  - tailscale
  - nodejs

openclaw:
  group.present: []

pema:
  user.present:
    - shell: /bin/bash
    - home: /home/pema
    - optional_groups:
      - openclaw
    - createhome: True
    - require:
      - group: openclaw

dorje:
  user.present:
    - shell: /bin/bash
    - home: /home/dorje
    - optional_groups:
      - openclaw
    - createhome: True
    - require:
      - group: openclaw

norba:
  user.present:
    - shell: /bin/bash
    - home: /home/dorje
    - optional_groups:
      - openclaw
    - createhome: True
    - require:
      - group: openclaw
