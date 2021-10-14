# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


 * **edtasixm06/ldap21:schema** Servidor LDAP amb la base de dades edt.org
   S'ha fet el següent:

   * futbolistaA.schema Derivat de inetorgPerson, structural, injectat dades
     de dades-futbolA.ldif.

```
$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisix          -p 389:389 -it edtasixm06/ldap21:schema /bin/bash

$ docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisix -p 80:80 -d edtasixm06/phpldapadmin:20
```



