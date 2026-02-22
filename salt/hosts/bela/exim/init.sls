include:
- exim
- spamassassin

/etc/exim/exim.conf:
  file.managed:
  - source: salt://hosts/bela/exim/exim.conf
  - mode: "0644"
