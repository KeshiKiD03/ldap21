# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del Treball de Barcelona.

### Ldap servers:

<img src="https://phoneky.co.uk/thumbs/screensavers/down/original/linux_3rj131p8.gif" width="40" height="40" />


 * **keshikid03/ldap21:base** Servidor LDAP base inicial amb la base de dades edt.org. Els elements bàsics de configuració i els usuaris bàsics.
 
 * **keshikid03/ldap21:editat** Imatge base amb modificacions de tipus MBD: DN amb UID. Password xifrat de cn=Manager,dc=edt,dc=org. Únic ldif (edt.org.ldif). 

 * **keshikid03/ldap21:schema** Imatge editat amb modificacions de SCHEMES i Objectes Estructurals. Afegim a la BD, edt.org, nous objectClass i atributs definits en un schema inventat: futbolistes.schema
 
 * **keshikid03/ldap21:practica** Imatge schema amb modificacions de SCHEMES i Objectes Estructurals i Personalitzats. Afegim a la BD, edt.org, nous objectClass i atributs definits en un schema inventat: kpop.schema.
 
 * **keshikid03/ldap21:acl** Imatge schema per a fer modificacions de ACL. S'ha incorporat la BD cn=config per a l'administració del servidor dinàmicament.


## INDEX
**DOCKER**: [readme DOCKER](https://github.com/KeshiKiD03/ldap21#docker)

**LDAP**: [readme LDAP](https://github.com/KeshiKiD03/ldap21#ldap-server-2)
* **INSTAL·LACIÓ I CONFIGURACIÓ**: [readme LDAP 'INSTAL·LACIÓ I CONFIGURACIÓ'](https://github.com/KeshiKiD03/ldap21#installaci%C3%B3-i-configuraci%C3%B3)
* **CONSULTES (LDAPSEARCH)**: [readme LDAP 'CONSULTES (LDAPSEARCH)'](https://github.com/KeshiKiD03/ldap21#consultes-ldapsearch)
* **INSERCIÓ, MODIFICACIÓ I ESBORRAT**: [readme LDAP 'INSERCIÓ, MODIFICACIÓ I ESBORRAT'](https://github.com/KeshiKiD03/ldap21#inserci%C3%B3-modificaci%C3%B3-i-esborrat)
* **SLAPPASSWD I LDAPPASSWD**: [readme LDAP 'SLAPPASSWD I LDAPPASSWD'](https://github.com/KeshiKiD03/ldap21#slappasswd-i-ldappasswd)
* **SCHEMES**: [readme LDAP 'SCHEMES'](https://github.com/KeshiKiD03/ldap21#schemes)
* **ACL**: [readme LDAP 'ACL'](https://github.com/KeshiKiD03/ldap21#acl)



## COMANDES
### DOCKER

⭐️ **Execució** ⭐️

Executar una imatge de DOCKER DEBIAN:LATEST en mode Interactiu (Foreground)
```
docker run --rm --name debianKeshi -h debianKeshi -it debian:latest /bin/bash
```

Executar una imatge DOCKER DEBIAN:LATEST en mode Detach (Background)
```
docker run --rm --name debianKeshi -h debianKeshi -d debian:latest /bin/bash
```

Executar una imatge de LDAP amb network 2hisx i propagació del port 389
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -it keshikid03/ldap21:acl /bin/bash

docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d keshikid03/ldap21:acl
```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *docker run fa docker create i docker start* |
| * **--rm**: Borra el container al sortir, la deixa verge. |
| * **--name**: Nom del container. |
| * **-h**: Nom del host del container. |
| * **-it**: La imatge que volem executar i en mode Interactiu (Foreground). |
| * **-d**: Mode Detach (Background). |
| * **--net**: Network creada. |
| * **-p**: Propagació del port. |


⭐️ **ATTACH (Adherirse a un container engegat amb procesos oberts)** ⭐️
```
docker start ldap.edt.org
```
```
docker attach ldap.edt.org
```
Millor
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d keshikid03/ldap21:acl
```
```
docker exet -it ldap.edt.org /bin/bash
```
| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *docker attach sol fallar* |

⭐️**Execució de comandes en mode detach** ⭐️

Posem en marxa el container ldap.edt.org
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d keshikid03/ldap21:acl
```

Mostrem la IP de DOCKER
```
docker exet ldap.edt.org ip a
```
| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *Podem executar milers de comandes*    |


⭐️ **Enllistar** ⭐️

Mostrar les imatges de DOCKER
```
docker images
```

Mostrar els containers de DOCKER (All)
```
docker container ls -la
```

⭐️ **Informació técnica** ⭐️

Mostrar la informació técnica detallada de la imatge
```
docker inspect keshikid03/ldap21:tag
```


⭐️ **Esborrar IMATGE/CONTAINER, pause i stop** ⭐️

Esborrar les imatges de DOCKER
```
docker rmi [ID]
```

Esborrar containers de DOCKER
```
docker rm [CONTAINER]
```

Mata el container actiu de DOCKER
```
docker kill [CONTAINER]
```

Pausa el container actiu de DOCKER
```
docker pause [CONTAINER]
```

Atura el container actiu de DOCKER
```
docker stop [CONTAINER]
```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *Per esborrar primer s'ha d'aturar amb un docker stop (container) / CTRL-P + CTRL+Q: Surt d'un container sense parar-ho, es pot tornar amb un attach o amb exec -it (container) /bin/bash* |

⭐️ **Esborrar** ⭐️

Esborrar les imatges de DOCKER
```
docker rmi [ID]
```

Esborrar containers de DOCKER
```
docker rm [CONTAINER]
```
| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *Per esborrar primer s'ha d'aturar amb un docker stop [container]* |



⭐️ **Renombrar** ⭐️

Renombre les imatges de DOCKER
```
docker rename [container] [new_container]
```


⭐️ **Procesos i monitorització** ⭐️

Mostrar els processos actius dels contenidors DOCKER
```
docker ps
```

Mostrar lo que s'executa en el contenidor de DOCKER
```
docker top ldap.edt.org ls
```

Monitoritza el contenidor de DOCKER
```
docker stat ldap.edt.org
```


⭐️ **Networking** ⭐️

Crear una xarxa
```
docker network create 2hisx
```

Inspeccionar una xarxa de Docker
```
docker network inspect 2hisx
```

Mostrar una xarxa de Docker
```
docker network ls 
```

Borrar una xarxa de Docker
```
docker network rm 2hisx
```

⭐️ **Credencials** ⭐️

Inicia sessió de DOCKER HUB
```
docker login
```

Tanca sessió de DOCKER HUB
```
docker logout
```

⭐️ **History** ⭐️

Mostra les diferents fases per on ha passat la imatge
```
docker history keshikid03/ldap21:acl
```

⭐️ **Recerca** ⭐️

Busca una imatge en el respositori de DOCKER HUB
```
docker search mysql
```

⭐️ **Recerca** ⭐️

Busca una imatge en el respositori de DOCKER HUB
```
docker search mysql
```

⭐️ **Etiqueta** ⭐️

Etiqueta una imatge per ser propietari
```
docker tag edtasim06/ldap21:base keshikid03/ldap21:base
```



⭐️ **DOCKERFILE** ⭐️

Crear una imatge per mitjà d'un Dockerfile
```
docker build -t keshikid03/ldap21:base .
```

Colons can be used to align columns.

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *Exemple de Dockerfile*     |



```
# ldapserver
FROM debian:latest
LABEL version="1.0"
LABEL author="@edt ASIX-M06"
LABEL subject="ldapserver"
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install procps iproute2 tree nmap vim ldap-utils slapd less 
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh
WORKDIR /opt/docker
CMD /opt/docker/startup.sh
EXPOSE 389
```


| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *Seeing inside DOCKERFILE*     |
| * **FROM**: De quina imatge partim copiarem les dades. |
| * **LABEL version**: Versió del Dockerfile. |
| * **LABEL author**: Author del Dockerfile. |
| * **LABEL subject**: Nom del Dockerfile. |
| * **RUN**: Executa comandes durant el docker build, per input. |
| * **ARG DEBIAN_FRONTEND**: Per poder executar comandes com per exemple en segon pla. Per defecte posem noninteractive. |
| * **COPY**: Copia l'origen en aquest cas * (ALL) a un directori /opt/docker |
| * **WORKDIR**: Directori de treball un cop iniciat docker. |
| * **CMD**: Executa scripts. |
| * **EXPOSE**: Propagació del port. |

⭐️ **COMMIT** ⭐️

Crear una snapshot a partir del container engegat, es a dir, salvaguardem el punt de partida en una altre imatge.
```
docker commit -m "La meva nova imatge editada de ACL, modificada" ldap.edt.org keshikid03/ldap21:acl_v1
```
```
docker commit ldap.edt.org keshikid03/ldap21:acl_v1
```

⭐️ **ALWAYS ACTIVE** ⭐️

Engegar un container sempre al iniciar DOCKER
```
docker run --restart always --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d keshikid03/ldap21:acl
```
```
systemctl is-enabled docker
```

# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

---------------------------------------------------------------------------

### INSTAL·LACIÓ I CONFIGURACIÓ

1. Instal·lar i configurar DOCKER. [install DOCKER](https://docs.docker.com/engine/install/debian/)

2. Que es LDAP? [what is LDAP](https://ldapwiki.com/wiki/LDAP)

| LDAP ✅      | 
| ------------- |
| *slapd: Es el daemon del servidor* |
| *ldap-utils: Son les comandes del client* |

3. Iniciem una nova imatge de Docker que será basada en DEBIAN:LATEST.
```
docker run --name ldap.edt.org -h ldap.edt.org -it debian /bin/bash
```

4. Obrim una pestanya nova de terminal i visualitzem el contenidor engegat.
```
docker ps
```

5. Dins del contenidor realitzem.
```
apt-get update
```
```
apt-get -y install procps iproute2 vim tree nmap less
```
```
apt-get -y install slapd ldap-utils
```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *slapd: Es el daemon del servidor* |
| *ldap-utils: Son les comandes del client* |


6. 
```

```

7. aw
```

```

8. 2
```

```

9. 
```

```

10. 
```

```

11. 
```

```

10. 
```

```

11. aw
```

```

12. 2
```

```

13. 
```

```

14. 
```

```

15. 
```

```

16. 
```

```

17. aw
```

```

18. 2
```

```

19. 
```

```

20. 
```

```

21. 
```

```

22. 
```

```

23. aw
```

```

24. 2
```

```

25. 
```

```

26. 
```

```

27. 
```

```

28. 
```

```

29. aw
```

```

30. 2
```

```

31. 
```

```

32. 
```

```

33. 
```

```

34. 
```

```

### CONSULTES (LDAPSEARCH)

### INSERCIÓ, MODIFICACIÓ I ESBORRAT

### SLAPPASSWD I LDAPPASSWD

A

### SCHEMES

### ACL
























**ldapmodify**

**ldapmodify**

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

