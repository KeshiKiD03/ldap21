#! /bin/bash

# export DEBIAN_FRONTEND=noninteractive
# apt-get -y install slapd

rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/*
slaptest -f /opt/docker/slapd.conf -F /etc/ldap/slapd.d
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/edt.org.ldif
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/add-kpop-idols.ldif
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/add-kpop-workers.ldif
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/add-kpop-grups.ldif
slapadd  -F /etc/ldap/slapd.d -l /opt/docker/add-kpop-tv.ldif
slapcat

chown -R openldap.openldap /etc/ldap/slapd.d /var/lib/ldap
cp /opt/docker/ldap.conf /etc/ldap/ldap.conf

# Para mode Detach
/usr/sbin/slapd -d0

# Para mode IT
#/usr/sbin/slapd

# Pendent:
# configuració client
# posar totes les dades en una injecció massiva inicial

