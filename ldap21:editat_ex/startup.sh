#! /bin/bash

# export DEBIAN_FRONTEND=noninteractive
# apt-get -y install slapd

rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/*
slaptest -f /opt/docker/slapd.conf -F /etc/ldap/slapd.d
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/edt.org.ldif
slapcat

chown -R openldap.openldap /etc/ldap/slapd.d /var/lib/ldap
cp /opt/docker/ldap.conf /etc/ldap/ldap.conf
/usr/sbin/slapd -d0 


# Pendent:
# configuració client
# posar totes les dades en una injecció massiva inicial

