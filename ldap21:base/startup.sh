#! /bin/bash

# export DEBIAN_FRONTEND=noninteractive
# apt-get -y install slapd

rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/*
slaptest -f /opt/docker/slapd.conf -F /etc/ldap/slapd.d
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/organitzacio-edt.org.ldif
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/usuaris-edt.org.ldif
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/usuaris-mes-edt.org.ldif
slapcat

chown -R openldap.openldap /etc/ldap/slapd.d /var/lib/ldap
/usr/sbin/slapd -d0 


# Pendent:
# configuració client
# posar totes les dades en una injecció massiva inicial

