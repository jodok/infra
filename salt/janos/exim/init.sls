include:
- exim
- spamassassin

/etc/exim/exim.conf:
  file.managed:
  - source: salt://janos/exim/exim.conf
  - mode: "0644"

/etc/exim/private:
  file.directory:
  - mode: "0770"
  - user: exim
  - group: exim

/etc/exim/private/dkim-private.pem:
  cmd.run:
  - name: openssl genrsa -out /etc/exim/private/dkim-private.pem 1024
  - runas: exim
  - unless: test -f /etc/exim/private/dkim-private.pem

/etc/exim/private/dkim-public.pem:
  cmd.run:
  - name: openssl rsa -in /etc/exim/private/dkim-private.pem -pubout -out /etc/exim/private/dkim-public.pem
  - runas: exim
  - unless: test -f /etc/exim/private/dkim-public.pem

# set DNS record.
#v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2AM0phqS5RaZGAh9ajvRVi/pR/CESlt8g2/HVQ9NDcrKQBX/VMBVjm79h1XfJ1ADEkyI11smkWVCDyAwMyrQ/Y54w2U0er2zhVqfEL0mpRtiLwAPf4ajzvmzCgBxLMtKWI8fxzBx5AGX1Ns/Het13VCbLLlVul2ZGilnCKdXykBAeXuRs1rup1904q9hIhyW6kNqnAjdyp43070KC2D+VYGBKdxEQXbFHROlEOtxQGW+pCx9PE7zUZXt2uUbQtwOM8XVU3ehbUt8zQKan+wsnpwHdhJOcF2G7zYAg4IEyqs+R+SGhcSX7nqJVF0TSh6D44oL5qmeFUomnWmdj68n4wIDAQAB
