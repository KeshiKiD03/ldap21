#! /bin/bash

# Quan hagis executat el startup.sh executa aquest fitxer per posar els usuaris

ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-idols.ldif
ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-workers.ldif
ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-grups.ldif
ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-tv.ldif

