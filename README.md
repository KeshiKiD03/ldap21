# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del Treball de Barcelona.

### Ldap servers:

<img src="https://phoneky.co.uk/thumbs/screensavers/down/original/linux_3rj131p8.gif" />

 * **keshikid03/ldap21:base** Servidor LDAP base inicial amb la base de dades edt.org. Els elements bàsics de configuració i els usuaris bàsics.
 
 * **keshikid03/ldap21:editat** Imatge base amb modificacions de tipus MBD: DN amb UID. Password xifrat de cn=Manager,dc=edt,dc=org. Únic ldif (edt.org.ldif). 

 * **keshikid03/ldap21:schema** Imatge editat amb modificacions de SCHEMES i Objectes Estructurals. Afegim a la BD, edt.org, nous objectClass i atributs definits en un schema inventat: futbolistes.schema
 
 * **keshikid03/ldap21:practica** Imatge schema amb modificacions de SCHEMES i Objectes Estructurals i Personalitzats. Afegim a la BD, edt.org, nous objectClass i atributs definits en un schema inventat: kpop.schema.
 
 * **keshikid03/ldap21:acl** Imatge schema per a fer modificacions de ACL. S'ha incorporat la BD cn=config per a l'administració del servidor dinàmicament.


## INDEX
**DOCKER**: [readme DOCKER](https://github.com/KeshiKiD03/ldap21#docker)

**LDAP**: [readme LDAP](https://github.com/KeshiKiD03/ldap21#ldap-server-1)
* **INSTAL·LACIÓ I CONFIGURACIÓ**: [readme](https://github.com/KeshiKiD03/ldap21#installaci%C3%B3-i-configuraci%C3%B3)
* **CONSULTES (LDAPSEARCH)**: [readme](https://github.com/KeshiKiD03/ldap21#consultes-ldapsearch)
* **INSERCIÓ, MODIFICACIÓ I ESBORRAT**: [readme](https://github.com/KeshiKiD03/ldap21#inserci%C3%B3-modificaci%C3%B3-i-esborrat)
* **SLAPPASSWD I LDAPPASSWD**: [readme](https://github.com/KeshiKiD03/ldap21#slappasswd-i-ldappasswd)
* **SCHEMES**: [readme](https://github.com/KeshiKiD03/ldap21#schemes)
* **ACL**: [readme](https://github.com/KeshiKiD03/ldap21#acl)



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

⭐️ **Copiar fitxers del DOCKER al HOST** ⭐️

Copiem arxius desde dins del DOCKER al HOST
```
docker cp [container]:/[ruta] [ruta_host]
```

Copiem arxius desde el HOST al DOCKER
```
docker cp [ruta_host] [container]:/[ruta] 
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

2. Que es LDAP? [what is LDAP](https://www.profesionalreview.com/2019/01/05/ldap/)

| LDAP ✅      | 
| ------------- |
| *LDAP es un conjunt de protocols que són utilitzats per accedir a la informació emmagatzemada de forma centralitzada en forma d'arbre en la xarxa.* |
| *S'utilitza a nivell d'aplicació.* |
| *Model client-servidor.* |
| *Conjunt d'objectes que están organitzats en forma jerarquica.*|
| *Funcionament similar al Active Directory de Windows.*|
| *Utilitza el port 389 per a comunicar-se.*|
| *Permet autenticació d'usuaris de forma eficaç.*|


3. Iniciem una nova imatge de Docker que será basada en DEBIAN:LATEST.
```
docker run --name ldap.edt.org -h ldap.edt.org -it debian /bin/bash
```

4. Obrim una pestanya nova de terminal i visualitzem el contenidor engegat.
```
docker ps
```

5. Dins del contenidor realitzem, una actualizació, després els paquets bàsics i els paquets de LDAP.
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
| *slapd: Es el daemon del servidor. En algun moment ens demanarà password de Root. Com a password li posem "secret"* |
| *ldap-utils: Son les comandes del client.* |
| *iproute2: Per a poder fer ip a, route, arp.* |
| *procps: Utilitats de consola.* |
| *procps: Mapeig de ports.* |


6. Observem amb *dpkg* quines ordres ens ha instal·lat.
```
dpkg -L slapd | grep "/bin" o dpkg -L ldap | grep "/bin" 
```

7. Al instal·lar *slapd* s'ha creat /etc/ldap. Dins de /etc/ldap/.

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *ldap.conf --> Configuració client.* |
| *slapd.conf --> Configuració del servidor.* |
| *slapd.d --> Directori de configuració del servidor.* |
| *slap... --> Ordres de Servidor.* |
| *ldap... --> Ordres de Client.* |


8. Fem un *tree* per veure la estructura del servidor per defecte. I fer un *slaptest* per a verificar la integritat del LDAP.
```
tree /etc/ldap/slapd.d
```
```
slaptest # Genera un directori de configuració a partir d'un fitxer
```

9. Fet un GIT CLONE del GITHUB del PROFE. I copiem  certs fitxets.
```
git clone https://github.com/edtasixm06/ldap21.git
```

10. Ens movem a /etc/ldap.
```
cd /etc/ldap
```

11. Copiem el contingut del *slapd.conf* del PROFE al nostre.
```
vim slapd.conf
```
```
...
include		/opt/docker/aaron.schema

database mdb
suffix "dc=edt,dc=org"
rootdn "cn=Manager,dc=edt,dc=org"
rootpw {SSHA}nGnnCLjjdiKky4o0swoYmTOW4F8cJOWq
directory /var/lib/ldap
index objectClass eq,pres
access to * by self write 	by * read

```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *slapd.conf --> Configuració del servidor.* |
| ------------- |
| *suffix --> Nom del servidor* |
| *rootdn --> Nom del ROOT, root distinguished name* |
| *rootpw --> Password ROOT, preferiblement xifrat SSHA* |
| *directory --> Directory d'usuari* |
| *access --> ACL, tothom té accés, només l'usuari actual pot escriure i tothom pt llegir * |
| *include* --> Inserció d'esquemes |

10. Amb la comanda slaptest ensamblem el LDAP.
```
slaptest -f slapd.conf -F slapd.d -u
```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *slaptest --> Ensamblar servidor.* |
| ------------- |
| *-f --> Arxiu de configuració* |
| *-F --> Output* |
| *-u --> Omet i segueix endavant, omet errors* |


11. Verifiquem la configuració de LDAP.
```
slapcat
```
```
slapcat -n0 # Motor del LDAP
```
```
slapcat -n1 # BD de l'usuari
```

12. Borrem lo que hi hà per defecte que genera LDAP. 
```
rm -rf slapd.d/* /var/lib/ldap/*
```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *slaptest --> Ensamblar servidor.* |
| ------------- |
| *slapd.d/. --> Directori Daemon LDAP* |
| */var/lib/ldap --> Directori de dades, on el sistema posa les dades* |
| *-u --> Omet i segueix endavant, omet errors* |

13. Tornem a copiar i enganxar la configuració del *slapd.conf* del PROFE al nostra *slapd.conf*.
```
vim slapd.conf # COPIAR EL GIT DEL PROFE
```

14. Tornar a fer la comanda *slaptest*
```
slaptest -f slapd.conf -F slapd.d -u
```

15. Fer la injecció massiva de la configuració de la estructura de la BD *organització.ldif* del GIT del PROFESSOR a la nostra carpeta.
```
slapadd -F /etc/ldap/slapd.d -l organitzacio.ldif
```

16. Visualitzem el resultat amb *slapcat*
```
slapcat
```

17. Fem un ls de /var/lib/ldap per veure el resultat.
```
ls -l /var/lib/ldap
```

18. Cambiem els permisos d'ambdós directoris:
```
sudo chown -R openldap.openldap slapd.d /var/lib/ldap
```

19. Fem un ls de /var/lib/ldap i de /etc/ldap/slapd.d per veure el resultat.
```
ls -l /var/lib/ldap
```
```
ls -l /etc/ldap/slapd.d
```


20. Fer la injecció massiva dels usuaris pero desde el client *usuaris-edt.org.ldif* del GIT del PROFESSOR a la nostra carpeta.
```
ldapadd -x -h localhost -D 'cn=Manager,dc=edt,dc=org' -w secret -F usuaris-edt.org.ldif
```

21. Iniciem el DAEMON abans.
```
/usr/sbin/slapd
```

22. Visualitzem el resultat amb *slapcat*
```
slapcat
```

23. Realitzem una consulta a veure si funciona
```
ldapsearch -x -LLL -h localhost -b 'dc=edt,dc=org'
```
| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *ldapsearch --> SELECT.* |
| ------------- |
| *-x --> Autenticació simple* |
| *-LLL --> Sense capçalera, simple* |
| *-h --> Host (Configurable en /etc/ldap/ldap.conf --> URI)* |
| *-b --> Base Search (Configurable en /etc/ldap/ldap.conf --> BASE)* |



### CONSULTES (LDAPSEARCH)

* Fer una recerca de totes les dades de la database edt org
```
ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
```

* 

* 

* 

* 

* 

* 

* 

* 

* 

* 

* 

* 

* 

* 

### INSERCIÓ, MODIFICACIÓ I ESBORRAT

**LDAPADD**

A partir del fichero *keshi_inserir.ldif*

```
# PRACTICA EXEMPLE DE INSERIR, BORRAR I MODIFICAR USUARIS .LDIF
# Generar Password amb slappasswd -h {SSHA} - Per defecte SSHA
# root@ldap:/opt/docker# slappasswd
# New password: 
# Re-enter new password: 
# {SSHA}uPEwFg+pBqWbr/LLWEt25YiH8hpv7NG5
# root@ldap:/opt/docker# 
# PARA LDAP21:EDITAT_EX

dn: cn=Keshi Kid,ou=usuaris,dc=edt,dc=org
objectclass: posixAccount
objectclass: inetOrgPerson
cn: Keshi
cn: Kid
sn: Keshikid
homephone: 565-764-967
mail: keshi@edt.org
description: Keshi
ou: Profes
uid: keshi
uidNumber: 5005
gidNumber: 100
homeDirectory: /tmp/home/keshi
userPassword: {SSHA}uPEwFg+pBqWbr/LLWEt25YiH8hpv7NG5

# dn = Distinguished Name
# cn = Common Name
# sn = surname
# homephone = Telefon
# mail = mail
# description = descripció de l'usuari
# ou = Profes
# uid = nom del ID
# uidNumber = numberID 
# gidNumber = grup ID del usuari
# homeDirectory = home de l'usuari
# userPasswrd = Password de l'usuari xifrat
```

 
---------------------------------------------------------

1. Insertar el usuario a partir del fichero con el usuario cn=Manager : -w secret

Antes hacemos un slappasswd para generar la llave cifrada SSHA y copiarla en userPassword.

```
ldapadd -x -D "cn=Manager,dc=edt,dc=org" -w secret -f keshi_inserir.ldif
```

2. Hacemos un ldapsearch para buscar el usuario creado (NO TENEMOS EL BASE SEARCH E URI CONFIGURADAS, toca localhost, 127.0.0.1 o la IP).
```
ldapsearch -x -LLL -h localhost -b 'dc=edt,dc=org' 'cn=Keshi Kid'
```

```
root@ldap:/opt/docker# ldapsearch -x -LLL -h localhost -b 'dc=edt,dc=org' 'cn=Keshi Kid'
dn: cn=Keshi Kid,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: Keshi
cn: Kid
cn: Keshi Kid
sn: Keshikid
homePhone: 565-764-967
mail: keshi@edt.org
description: Keshi
ou: Profes
uid: keshi
uidNumber: 5005
gidNumber: 100
homeDirectory: /tmp/home/keshi
userPassword:: e1NTSEF9dVBFd0ZnK3BCcVdici9MTFdFdDI1WWlIOGhwdjdORzU=
```

3. Verificamos nuestra identidad con el usuario creado dentro de ldap.edt.org.
```
ldapwhoami -x -D "cn= Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
```

root@ldap:/opt/docker# ldapwhoami -x -D "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
dn:cn=Keshi Kid,ou=usuaris,dc=edt,dc=org

4. Desde nuestro CLIENTE hacemos un ldapsearch con el contenedor ldap.edt.org encendido con credenciales del usuario creado i filtramos por el usuario creado.
```
ldapsearch -x -LLL -h 172.19.0.2 -b 'dc=edt,dc=org' 'cn=Keshi Kid' -D "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
```

```
keshi@KeshiKiD03:~/Documents/ldap21/ldap21:base_ex$ ldapsearch -x -LLL -h 172.19.0.2 -b 'dc=edt,dc=org' 'cn=Keshi Kid' -D "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
dn: cn=Keshi Kid,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: Keshi
cn: Kid
cn: Keshi Kid
sn: Keshikid
homePhone: 565-764-967
mail: keshi@edt.org
description: Keshi
ou: Profes
uid: keshi
uidNumber: 5005
gidNumber: 100
homeDirectory: /tmp/home/keshi
userPassword:: e1NTSEF9dVBFd0ZnK3BCcVdici9MTFdFdDI1WWlIOGhwdjdORzU=
```

5. Verificamos desde el CLIENTE la identidad del usuario creado.
```
ldapwhoami -x -h 172.19.0.2 -D "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
```
```
keshi@KeshiKiD03:~/Documents/ldap21/ldap21:base_ex$ ldapwhoami -x -h 172.19.0.2 -D "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
dn:cn=Keshi Kid,ou=usuaris,dc=edt,dc=org

```

**LDAPDELETE**

A partir del fichero keshi_delete.ldif

```
# PRACTICA EXEMPLE DE INSERIR, BORRAR I MODIFICAR USUARIS .LDIF
# Generar Password amb slappasswd -h {SSHA} - Per defecte SSHA
# root@ldap:/opt/docker# slappasswd
# New password: 
# Re-enter new password: 
# {SSHA}uPEwFg+pBqWbr/LLWEt25YiH8hpv7NG5
# root@ldap:/opt/docker# 
# PARA LDAP21:EDITAT_EX
cn=Keshi Kid,ou=usuaris,dc=edt,dc=org
cn=Anna Pou,ou=usuaris,dc=edt,dc=org
cn=Pere Pou,ou=usuaris,dc=edt,dc=org

# Per esborrar usuaris es poden fer de 2 formes, per fitxer input .ldif o per ldapdelete "cn=Keshi Kid".
# Cal apuntar nom�s el CN amb persmisos d'administrador.
```

**Forma 1: Para el fichero keshi_delete.ldif desde el CLIENTE**
```
ldapdelete -vx -c -h 172.19.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret -f keshi_delete.ldif
```

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *ldapdeplete --> DELETE.* |
| ------------- |
| *-v --> Verbose* |
| *-x --> Sense capçalera, simple* |
| *-h --> Host (Configurable en /etc/ldap/ldap.conf --> URI)* |
| *-D --> Autenticació d'usuari, en aquest cas de ROOT)* |
| *-w --> Password en Input SECRET)* |
| *-f --> Fitxer LDIF)* |
| *Aquesta opció dona error si hi posem comentaris, fem -c per a que continui. SOLUCIÓ, no posar comentaris o posar comentaris i posar -c* |

```
keshi@KeshiKiD03:~/Documents/ldap21/ldap21:base_ex$ ldapdelete -vx -h 172.19.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret -f keshi_delete.ldif 
ldap_initialize( ldap://172.19.0.2 )
deleting entry "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org"
deleting entry "cn=Anna Pou,ou=usuaris,dc=edt,dc=org"
deleting entry "cn=Pere Pou,ou=usuaris,dc=edt,dc=org"
ldap_delete: No such object (32)
	matched DN: ou=usuaris,dc=edt,dc=org
```


Visualizamos el resultado
```
ldapsearch -x -LLL -h 172.19.0.2 -b 'dc=edt,dc=org'
```

**Forma 2: Para el fichero desde el CLIENTE**
```
ldapdelete -vx -h 172.19.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret 'cn=Keshi Kid,ou=usuaris,dc=edt,dc=org'
```
```
keshi@KeshiKiD03:~/Documents/ldap21/ldap21:practica$ ldapdelete -vx -h 172.19.0.2 -D 'cn=Manager,dc=edt,dc=org' -w secret 'cn=Keshi Kid,ou=usuaris,dc=edt,dc=org'
ldap_initialize( ldap://172.19.0.2 )
deleting entry "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org"
```

Visualizamos el resultado
```
ldapsearch -x -LLL -h 172.19.0.2 -b 'dc=edt,dc=org'
```


**LDAPMODIFY**



### SLAPPASSWD I LDAPPASSWD



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

