ncurses-bin:
  pkg.installed: []

/usr/local/share/terminfo:
  file.directory:
  - user: root
  - group: root
  - dir_mode: "0755"

/usr/local/share/terminfo/xterm-ghostty.src:
  file.managed:
  - source: salt://common/xterm-ghostty.src
  - user: root
  - group: root
  - mode: "0644"
  - require:
    - file: /usr/local/share/terminfo

xterm-ghostty-terminfo:
  cmd.run:
  - name: tic -x -o /usr/share/terminfo /usr/local/share/terminfo/xterm-ghostty.src
  - unless: test -e /usr/share/terminfo/78/xterm-ghostty -o -e /lib/terminfo/78/xterm-ghostty
  - require:
    - pkg: ncurses-bin
    - file: /usr/local/share/terminfo/xterm-ghostty.src
