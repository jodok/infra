#!/bin/sh
# you can also use tcp/ip here, consult spamc(1)
#exec /usr/bin/spamc -u ${1} -L spam -C report
exec /usr/bin/spamc -u ${1} -L spam
#exec /usr/bin/sa-learn -u ${1} --spam
