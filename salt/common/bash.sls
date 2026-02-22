/etc/bash.bashrc-prompt:
  file.blockreplace:
    - name: /etc/bash.bashrc
    - marker_start: "# START managed by salt: common.bash prompt"
    - marker_end: "# END managed by salt: common.bash prompt"
    - append_if_not_found: True
    - content: |
        parse_git_branch() {
          git branch --show-current 2>/dev/null
        }

        prompt_command() {
          local exit="$?"

          # hostname (red)
          local host="\[\033[31m\]\h\[\033[0m\] "

          # arrow (green/red based on exit)
          if [ "$exit" -eq 0 ]; then
            local arrow="\[\033[1;32m\]➜\[\033[0m\] "
          else
            local arrow="\[\033[1;31m\]➜\[\033[0m\] "
          fi

          # cwd (cyan)
          local cwd="\[\033[36m\]\W\[\033[0m\] "

          # git branch
          local git_branch
          git_branch="$(parse_git_branch)"
          if [ -n "$git_branch" ]; then
            git_branch="git:($git_branch) "
          fi

          PS1="${host}${arrow}${cwd}${git_branch}"
        }

        PROMPT_COMMAND=prompt_command

# Ghostty
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
  - unless: |
      src=/usr/local/share/terminfo/xterm-ghostty.src
      out_hex=/usr/share/terminfo/78/xterm-ghostty
      out_chr=/usr/share/terminfo/x/xterm-ghostty
      alt_hex=/lib/terminfo/78/xterm-ghostty
      alt_chr=/lib/terminfo/x/xterm-ghostty
      { [ -e "$out_hex" ] && [ "$out_hex" -nt "$src" ]; } || \
      { [ -e "$out_chr" ] && [ "$out_chr" -nt "$src" ]; } || \
      { [ -e "$alt_hex" ] && [ "$alt_hex" -nt "$src" ]; } || \
      { [ -e "$alt_chr" ] && [ "$alt_chr" -nt "$src" ]; }
  - require:
    - pkg: ncurses-bin
    - file: /usr/local/share/terminfo/xterm-ghostty.src
