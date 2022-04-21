# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


 * **edtasixm06/ldap21:acl** Servidor LDAP amb la base de dades edt.org
   S'ha fet el següent:
   
   * eliminats el schema innecesaris

   * definir la base de dades cn=config amb usuari cn=Sysadmin,cn=config i passwd syskey cifrat


```
$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisix -p 389:389 -it keshikid03/ldap21:acl /bin/bash

$ docker ps

# Ver el motor del sistema

$ slapcat -n0

# Ver nuestra base de datos

$ ldapsearch -x -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config'


# Ver el olcAccess 

$ ldapsearch -x -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess

# Executar el fitxer acl1.ldif

$ ldapmodify -vxc -D 'cn=Sysadmin,cn=config' -w syskey -f acl1.ldif




$ docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/phpldapadmin:20
```



