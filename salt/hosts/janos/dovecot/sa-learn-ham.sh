#!/bin/sh
# you can also use tcp/ip here, consult spamc(1)
#exec /usr/bin/spamc -u ${1} -L ham -C revoke
exec /usr/bin/spamc -u ${1} -L ham
#exec /usr/bin/sa-learn -u ${1} --ham
