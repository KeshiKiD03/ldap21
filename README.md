# LDAP server
## @edt ASIX M06-ASO Curs 2021-2022

### Ldap servers:

 * **edtasixm06/ldap21:base** Server bàsic ldap, amb base de dades edt.org.
# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


 * **edtasixm06/ldap21:base** Servidor LDAP base inicial amb la base de dades edt.org
 
 * **edtasixm06/ldap21:editat** Imatge base amb modificacions: dn amb uid.

Crear una xarxa
```
docker network create hisx2
```

Crear un docker per un Dockerfile
```
docker build -t edtasixm06/ldap21:base .
```

Executar un container amb una network
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net hisx2 -d edtasixm06/ldap21:base
```

Veure containers actius
```
docker ps
```

Fer una recerca de totes les dades de la database edt org
```
ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
```

Afegir usuaris desde un fitxer .ldif
```
ldapadd -x -c -h 172.17.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret -f afegir.ldif 
```

Eliminar desde un fitxer .ldif
```
ldapdelete -vx -h 172.17.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret -f eliminats.ldif 
```

* **ldapmodify**
*  **changetype(delete=ldapdelete////**
*  **add=ldapadd////**
*  **modify=permet modificar(replace=reemplazar/add=afegir info/delete=eliminar algo de info))**
*   **changetype:**
*    **add**
*    **delete**
*    **modify**
					
Canviar la contrasenya en mode Verbose en el host 172.17.0.2 amb les credencials de Manager i password secret, la pass a canviar jupiter per l' user01
```
ldappasswd -x -v -h 172.17.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret -s jupiter 'cn=user01,ou=usuaris,dc=edt,dc=org'
```
Canviar la contrasenya en mode Verbose en el host 172.17.0.2 amb les credencials de Jordi Mas i password jordi, la pass a canviar jupiter
```
ldappasswd -x -v -h 172.17.0.2 -D 'cn=Jordi Mas,ou=usuaris,dc=edt,dc=org' -w jordi -s jupiter
```

Modificar el registre en mode verbose i omitint errors en el host 172.17.0.2, amb les credencials de Marta Mas i password marta, en input el fitxer modify2.ldif
```
ldapmodify -cv -x -h 172.17.0.2 -D "cn=Marta Mas,ou=usuaris,dc=edt,dc=org" -w marta -f modify2.ldif 
```

Modificar el registre amb el host del Docker com a Manager amb les credencials de secret en input el fitxer modify1.ldif
```
ldapmodify -x -h 172.17.0.2 -D "cn=Manager,dc=edt,dc=org" -w secret -f modify1.ldif
```
Buscar en el base search, a Marta Mas, mostra'm el dn homephone i mail
```
ldapsearch -x -LLL -h 172.17.0.2 -b 'dc=edt,dc=org' 'cn=Marta Mas' dn homephone mail 
```

Compara si s'ha posat be lo que li posem per teclat amb el registre que hi ha en el ldap
```
ldapcompare -x -h 172.17.0.2 'cn=Marta Mas,ou=usuaris,dc=edt,dc=org' mail:marta@edt.org
```

En el base search fa un AND i després un OR de group Number 610 o 611 i a mes tots els registres que tenen com a commmon name començin per user*
```
ldapsearch -x -LLL -h 172.17.0.2 -b 'dc=edt,dc=org' '(&(|(gidNumber=610)(gidNumber=611))(cn=user*))'
```

/etc/ldap/ldap.conf es configuració del client
Base dc=edt,dc=org
URI ldap.edt.org
docker run --rm --name client -h client --net 2hisix -it edtasixm06/ldap21:base /bin/bash



propagar port= vincular port de container amb port de la maquina real/servidor


0.0.0.0:389 totes les maquines de l'orinador tindran obert port 389
```

