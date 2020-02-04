include:
- exim
- spamassassin

/etc/exim/exim.conf:
  file.managed:
  - source: salt://bela/exim/exim.conf
  - mode: "0644"
