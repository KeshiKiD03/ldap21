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

 * **keshikid03/ldap21:group** Imatge per a fer modificacions de grups, es crea una OU nova i s'afegeixen grups. Es defineixen varies mitjançant el objecClass = posixGroup.


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
 
- Es importante configurar el ldap.conf tanto de cliente como de servidor. Sino buscará en el Gandhi.
- -x (Simple authentication)
- -D (Autenticarse)
- -w (Contraseña en texto plano)
- -W (Introducir contraseña)
- -LLL (Obtener respuestas 'planas', sin encabezados ni comentarios, solo datos de respuesta).
- & --> AND
- | --> OR
- ! --> NOT
- Ejemplo: (& ( | (cn=* Mas) (cn=* Pou) ) (gidNumber=600) ) # AND de 2 objetos, uno es obligatorio y el otro es uno de los 2 si cumple.
- ldapserach -x -LLL [-h 172.18.0.2 -b 'dc=edt,dc=org'] dn cn mail uid uidNumber
Nos muestra el arbol de directorio, pero sólo los campos Distinguished Name, Common Name, Mail, Identificador y UidNumber.
- ldapsearch -x -LLL '(|(cn=user01)(cn=user02))' --> Importante poner las comillas simples fuera del condicional. Verificar parentesis.
- ldapsearch -x -LLL '(!(gidNumber=100))' --> Importante estructura parentesis.
- ldapsearch -x -LLL -D "cn=Manager,dc=edt,dc=org" -w secret
 

**LDAPSEARCH**
-----------


Repaso práctico inventado.
- Muestrame el DN.
```
ldapsearch -x -LLL dn

dn: ou=clients,dc=edt,dc=org

dn: ou=productes,dc=edt,dc=org

dn: ou=grups,dc=edt,dc=org

dn: ou=usuaris,dc=edt,dc=org

dn: uid=pau,ou=usuaris,dc=edt,dc=org
```


- Muestrame el user01 y user02.
```
ldapsearch -x -LLL '(|(cn=user01)(cn=user02))'

dn: uid=user01,ou=usuaris,dc=edt,dc=org

dn: uid=user02,ou=usuaris,dc=edt,dc=org
```

- Muestrame el usuario 07 o new02 y que tenga grupo 614.
```
ldapsearch -x -LLL '(&(|(cn=user07)(cn=new02))(gidNumber=614))'

dn: uid=new02,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: new02
sn: new02
uid: new02
uidNumber: 7021
gidNumber: 614
homeDirectory: /tmp/home/2asix/new02
userPassword:: e1NTSEF9eVVSZDRIL0xLaU5oVlBldnFhNWFldjZ4T2djdHJVeUc=
```

- Muestrame el cn=* Pou.
```
ldapsearch -x -LLL 'cn=* Pou' | grep dn

dn: uid=pau,ou=usuaris,dc=edt,dc=org
dn: uid=pere,ou=usuaris,dc=edt,dc=org
dn: uid=anna,ou=usuaris,dc=edt,dc=org

ldapsearch -x -LLL 'cn=* Pou' dn

dn: uid=pau,ou=usuaris,dc=edt,dc=org

dn: uid=pere,ou=usuaris,dc=edt,dc=org

dn: uid=anna,ou=usuaris,dc=edt,dc=org
```

- Muestrame los usuarios que empiecen con el número de teléfono 555*.
```
root@ldap:/opt/docker# ldapsearch -x -LLL -h 172.18.0.2 -b 'dc=edt,dc=org' 'homePhone=555*' homePhone
dn: uid=pau,ou=usuaris,dc=edt,dc=org
homePhone: 555-222-2220

dn: uid=pere,ou=usuaris,dc=edt,dc=org
homePhone: 555-222-2221

dn: uid=anna,ou=usuaris,dc=edt,dc=org
homePhone: 555-222-2222

dn: uid=marta,ou=usuaris,dc=edt,dc=org
homePhone: 555-222-2223

dn: uid=jordi,ou=usuaris,dc=edt,dc=org
homePhone: 555-222-2224

dn: uid=admin,ou=usuaris,dc=edt,dc=org
homePhone: 555-222-2225
```

```
root@ldap:/opt/docker# ldapsearch -x -LLL -h 172.18.0.2 -b 'dc=edt,dc=org' 'homePhone=555*' | grep homePhone

homePhone: 555-222-2220
homePhone: 555-222-2221
homePhone: 555-222-2222
homePhone: 555-222-2223
homePhone: 555-222-2224
homePhone: 555-222-2225
homePhone: 555-222-0001
homePhone: 555-222-0002
homePhone: 555-222-0003
homePhone: 555-222-0004
homePhone: 555-222-0005
homePhone: 555-222-0006
homePhone: 555-222-0007
homePhone: 555-222-0008
homePhone: 555-222-0009
homePhone: 555-222-0016
```


- Muestrame los usuarios que no tengan como gidNumber empiecen por 100.
```
ldapsearch -x -LLL '(!(gidNumber=100))' | grep gidNumber

gidNumber: 600
gidNumber: 600
gidNumber: 10
gidNumber: 610
gidNumber: 610
gidNumber: 610
gidNumber: 610
gidNumber: 610
gidNumber: 611
gidNumber: 611
gidNumber: 611
gidNumber: 611
gidNumber: 611
gidNumber: 613
gidNumber: 614
```

- Muestrame todos los usuarios que empiecen por user
```
ldapsearch -x -LLL 'cn=user*'

root@ldap:/opt/docker# ldapsearch -x -LLL 'cn=user*' dn         
dn: uid=user01,ou=usuaris,dc=edt,dc=org

dn: uid=user02,ou=usuaris,dc=edt,dc=org

dn: uid=user03,ou=usuaris,dc=edt,dc=org

dn: uid=user04,ou=usuaris,dc=edt,dc=org

dn: uid=user05,ou=usuaris,dc=edt,dc=org

dn: uid=user06,ou=usuaris,dc=edt,dc=org

dn: uid=user07,ou=usuaris,dc=edt,dc=org

dn: uid=user08,ou=usuaris,dc=edt,dc=org

dn: uid=user09,ou=usuaris,dc=edt,dc=org

dn: uid=user10,ou=usuaris,dc=edt,dc=org
```

- Muestrame todos los usuarios que empiecen por new.
```
ldapsearch -x -LLL 'cn=new*'

root@ldap:/opt/docker# ldapsearch -x -LLL 'cn=new*'
dn: uid=new01,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: new01
sn: new02
uid: new01
uidNumber: 7020
gidNumber: 613
homeDirectory: /tmp/home/2asix/new01
userPassword:: e1NTSEF9MURITGdPMDNIZ1B4QTN1dmJYWVFjTTFSK1g5ZkxhVFc=

dn: uid=new02,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: new02
sn: new02
uid: new02
uidNumber: 7021
gidNumber: 614
homeDirectory: /tmp/home/2asix/new02
userPassword:: e1NTSEF9eVVSZDRIL0xLaU5oVlBldnFhNWFldjZ4T2djdHJVeUc=
```

- Muestrame los usuarios que no tengan como gidNumber empiecen por 100 y que tengan como usuario new*.
```
ldapsearch -x -LLL '(&(!(gidNumber=100))(cn=new*))'

root@ldap:/opt/docker# ldapsearch -x -LLL '(&(!(gidNumber=100))(cn=new*))'
dn: uid=new01,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: new01
sn: new02
uid: new01
uidNumber: 7020
gidNumber: 613
homeDirectory: /tmp/home/2asix/new01
userPassword:: e1NTSEF9MURITGdPMDNIZ1B4QTN1dmJYWVFjTTFSK1g5ZkxhVFc=

dn: uid=new02,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: new02
sn: new02
uid: new02
uidNumber: 7021
gidNumber: 614
homeDirectory: /tmp/home/2asix/new02
userPassword:: e1NTSEF9eVVSZDRIL0xLaU5oVlBldnFhNWFldjZ4T2djdHJVeUc=
```
- Muestrame los usuarios que no contengan Pou en su cn y que sean del grupo 610.
```
ldapsearch -x -LLL '(&(!(cn=*Pou*))(gidNumber=610))'

root@ldap:/opt/docker# ldapsearch -x -LLL '(&(!(cn=*Pou*))(gidNumber=610))'
dn: uid=user01,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: user01
cn: alumne01 de 1asix de todos los santos
sn: alumne01
homePhone: 555-222-0001
mail: user01@edt.org
description: alumne de 1asix
ou: 1asix
uid: user01
uidNumber: 7001
gidNumber: 610
homeDirectory: /tmp/home/1asix/user01
userPassword:: e1NIQX1vdmY4dGEvcmVZUC91MnpqMGFmcEh0OHlFMUE9
```

- Muestrame todos los usuarios que NO empiecen por new, que terminen con el telefono 002  y que no tengan como grupo 611.
```
ldapsearch -x -LLL '(&(!(cn=new*))(homephone=*002)(!(gidNumber=611)))'

root@ldap:/opt/docker# ldapsearch -x -LLL '(&(!(cn=new*))(homephone=*002)(!(gidNumber=611)))'
dn: uid=user02,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: user02
cn: alumne02 Pou Prat
sn: alumne02
homePhone: 555-222-0002
mail: user02@edt.org
description: alumne de 1asix
ou: 1asix
uid: user02
uidNumber: 7002
gidNumber: 610
homeDirectory: /tmp/home/1asix/user02
userPassword:: e1NIQX1vdmY4dGEvcmVZUC91MnpqMGFmcEh0OHlFMUE9
```

- Muestrame el usuario que termina en Mas y tenga como GID 600.
```
root@ldap:/opt/docker# ldapsearch -x -LLL '(&(cn=* Mas)(gidNumber=600))'
dn: uid=marta,ou=usuaris,dc=edt,dc=org
objectClass: posixAccount
objectClass: inetOrgPerson
cn: Marta Mas
sn: Mas
homePhone: 555-222-2223
mail: marta@edt.org
description: Watch out for this girl
ou: Alumnes
uid: marta
uidNumber: 5003
gidNumber: 600
homeDirectory: /tmp/home/marta
userPassword:: e1NTSEF9OSsxRjJmNXZjVzh6L3RtU3pZTldkbHo1R2JEQ3lvT3c=
```


Consultes ldapsearch [BASE]
--------------------
ldapsearch -x -LLL [Debería funcionar] [Estamos dentro del Servidor (Habiendo configurado ldap.conf)]

[Sino hay que configurar el /etc/ldap/ldap.conf]
En el servidor 

    BASE dc=edt,dc=org # (Base search -b)
    URI     ldap://ldap.edt.org # (Es el nombre del Host del Container)


```
   16  ldapsearch -x -LLL -h localhost -b 'dc=edt,dc=org'
   17  ldapsearch -x -LLL
   18  ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
   19  ldapsearch -x -LLL -h 127.0.0.1 -b 'dc=edt,dc=org'

```


En el *cliente*


    BASE dc=edt,dc=org # (Base search -b)
    URI     ldap://172.18.0.2 # (Es la ip del Host del Container)



Populate : Injecció massiva a la BD [Hacer un populate]

rdn= uid=pau

dn entero:

dn: uid=pau,ou=usuaris,dc=edt,dc=org







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

```
root@ldap:/opt/docker# ldapwhoami -x -D "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org" -w keshi
dn:cn=Keshi Kid,ou=usuaris,dc=edt,dc=org
```

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

**Ejemplo:
```
ubuntu@keshi:~/Documents/ldap21/ldap21:base_ex$ ldapdelete -x -h 172.18.0.2 -D "cn=Manager,dc=edt,dc=org" -w secret -f keshi_delete.ldif 
ldap_delete: Invalid DN syntax (34)
	additional info: invalid DN
	
ubuntu@keshi:~/Documents/ldap21/ldap21:base_ex$ ldapdelete -vx -h 172.18.0.2 -D "cn=Manager,dc=edt,dc=org" -w secret -f keshi_delete.ldif 
ldap_initialize( ldap://172.18.0.2 )
deleting entry "# DARA ERROR COMENTARIO"
ldap_delete: Invalid DN syntax (34)
	additional info: invalid DN
	
ubuntu@keshi:~/Documents/ldap21/ldap21:base_ex$ ldapdelete -vxc -h 172.18.0.2 -D "cn=Manager,dc=edt,dc=org" -w secret -f keshi_delete.ldif 
ldap_initialize( ldap://172.18.0.2 )
deleting entry "# DARA ERROR COMENTARIO"
ldap_delete: Invalid DN syntax (34)
	additional info: invalid DN
deleting entry "cn=Keshi Kid,ou=usuaris,dc=edt,dc=org"
deleting entry "cn=Anna Pou,ou=usuaris,dc=edt,dc=org"
deleting entry "cn=Pere Pou,ou=usuaris,dc=edt,dc=org"
```
*Solució: No posar comentaris en els fitxers d'esborrar.*


**Forma 2: Desde input mediante el CLIENTE**

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

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *ldapmodify --> MODIFICA.* |
| ------------- |
| *Engloba 4 modalitats: add, delete, modify, modrdn* |
| *Requereix el *changetype* obligatori* |
| *Per add:* |
| *Per delete:* |
| *Per modificar: Necesitem el *replace* |
| *-f --> Fitxer LDIF* |
| *Tot lo que s'escrigui fins que hagui un salt de línia, son modificacions, es posa un *-* *per a continuar editant atributs* |
| *Exemple de add [CHANGETYPE ADD]:* |
| *add: homephone* |
| *homephone: 343352* |
| *Es pot afegir diversos telefons* |
| *Exemple de modify[replace] [CHANGETYPE MODIFY]:* |
| *replace: mail [ATRIBUT]* |
| *mail: hola@edt.org* |
| *Exemple de delete [CHANGETYPE: DELETE]:* |
| *delete: description[ATRIBUT]* |
| *En MODIFY, pots combinar totes* |
| *delete: description [ATRIBUT]* |


A partir de los ficheros *keshi_modify1.ldif* *keshi_modify2.ldif*

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
changetype: modify
add: homephone
homephone: 555-857-123
-
replace: mail
mail: keshi03@edt.org
-
delete: description

# A partir d aqui es modifica una altra persona # S esborra AMB DELETE
dn: cn=Anna Pou,ou=usuaris,dc=edt,dc=org
changetype: delete

# Per a cada modify es pot fer replace | delete | add
dn: cn=Pere Pou,ou=usuaris,dc=edt,dc=org
changetype: modify
replace: sn
sn: perico
-
delete: homephone
-
add: description
description: els pericos aquest any a la xampions

dn: cn=Perico Pou,ou=usuaris,dc=edt,dc=org
changetype: modrdn
newrdn: cn=Pererico  Pou
deleteoldrdn: 1
# 1 true 0 false (default es 0)
# NOTA: El changetype "modify" pots posar add: [atribut] - replace: [atribut] - delete: [atribut]
# Cada espai es un objecte diferent, es a dir un dn diferent.
```

``` 

# PRACTICA EXEMPLE DE INSERIR, BORRAR I MODIFICAR USUARIS .LDIF
# Generar Password amb slappasswd -h {SSHA} - Per defecte SSHA
# root@ldap:/opt/docker# slappasswd
# New password: 
# Re-enter new password: 
# {SSHA}uPEwFg+pBqWbr/LLWEt25YiH8hpv7NG5
# root@ldap:/opt/docker# 
# PARA LDAP21:EDITAT_EX

dn: cn=Jordi Mas,ou=usuaris,dc=edt,dc=org
changetype: modify
add: mail
mail: patim@edt.org

dn: cn=Marta Mas,ou=usuaris,dc=edt,dc=org
changetype: modify
add: homephone
homephone: 555-123-123
# Es genera un nou modifyº

```

1. Insertar las modificaciones a partir del fichero *keshi_modify1.ldif* con el usuario cn=Manager : -w secret.
```
ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f keshi_modify1.ldif
```
```
ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f keshi_modify2.ldif
```


2. Verificamos el resultado
```
ldapsearch -x -LLL -h 172.18.0.2 -b 'dc=edt,dc=org'
```


### SLAPPASSWD I LDAPPASSWD

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *slappasswd --> GENERA CONTRASENYA DESDE EL SERVIDOR.* |
| *ldappasswd --> GENERA PASSWORD DESDE EL CLIENT.* |
| ------------- |
| *slappasswd --> genera una contrasenya xifrada en SSHA per defecte* |
| *ldappasswd --> canvia la contrasenya de l'usuari indicat o per fitxer* |

**slappasswd**

```
slappasswd -h {MD5} | {SHA} | {CRYPTE} | {SSHA}
```


**FORMA 1**

A partir del *keshi_ldappasswd.ldif*
```
# Exemple de modificar passwd

dn: cn=Anna Pou,ou=usuaris,dc=edt,dc=org
changetype: modify
replace: userPassowrd
userPassword: {SSHA}E8kbqFbBRrtyE0e1RL98BQJydhqlu9Sn
```
1. Verificamos primero que podemos hacer un ldapwhoami de Anna Pou.
```
root@ldap:/opt/docker# ldapwhoami -x -h localhost -D "cn=Anna Pou,ou=usuaris,dc=edt,dc=org" -w anna
dn:cn=Anna Pou,ou=usuaris,dc=edt,dc=org
```

2. Realizamos la modificación como Manager.
```
root@ldap:/opt/docker# ldapmodify -x -h localhost -D "cn=Manager,dc=edt,dc=org" -w secret -f keshi_ldappasswd.ldif 
modifying entry "cn=Anna Pou,ou=usuaris,dc=edt,dc=org"
```

3. Verificamos de nuevo con un ldapwhoami con el usuario de Anna, password modificada.
```
root@ldap:/opt/docker# ldapwhoami -x -h localhost -D "cn=Anna Pou,ou=usuaris,dc=edt,dc=org" -w pou 
dn:cn=Anna Pou,ou=usuaris,dc=edt,dc=org
```


**FORMA 2**

A partir de input ldappasswd -s (password a cambiar).
```
root@ldap:/opt/docker# ldappasswd -x -h localhost -D "cn=Anna Pou,ou=usuaris,dc=edt,dc=org" -w pou -s anna

```
```
root@ldap:/opt/docker# ldapwhoami -x -h localhost -D "cn=Anna Pou,ou=usuaris,dc=edt,dc=org" -w anna
dn:cn=Anna Pou,ou=usuaris,dc=edt,dc=org
```





# 🚧 UNDER CONSTRUCTION NO TIME, SOON WILL BE VISIBLE 🚧

### SCHEMES

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *SCHEMES --> ES.* |
| ------------- |
| **SCHEMES**: [readme SCHEMES](https://github.com/KeshiKiD03/ldap21/tree/main/ldap21:practica#readme) |



### ACL

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *ACL --> REGLES.* |
| ------------- |
| **SCHEMES**: [readme SCHEMES](https://github.com/KeshiKiD03/ldap21/tree/main/ldap21:practica#readme) |

### BACKUPS I RESTORE

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *BACKUP --> AMB TAR I RESTAURAR.* |
| ------------- |
| **SCHEMES**: [readme SCHEMES](https://github.com/KeshiKiD03/ldap21/tree/main/ldap21:practica#readme) |
### GRUPS

| 🔥NOTA IMPORTANT❗🔥 | 
| ------------- |
| *ou --> OU NUEVA.* |
| ------------- |
| **SCHEMES**: [readme SCHEMES](https://github.com/KeshiKiD03/ldap21/tree/main/ldap21:practica#readme) |


# 🚧 UNDER CONSTRUCTION NO TIME 🚧

**APUNTS DIVERSES**

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
```
/etc/ldap/ldap.conf es configuració del client
Base dc=edt,dc=org
URI ldap.edt.org
docker run --rm --name client -h client --net 2hisix -it edtasixm06/ldap21:base /bin/bash
```


propagar port= vincular port de container amb port de la maquina real/servidor

0.0.0.0:389 totes les maquines de l'orinador tindran obert port 389

# THANK YOU FOR READING !

<img src="https://phoneky.co.uk/thumbs/screensavers/down/original/linux_3rj131p8.gif" />

