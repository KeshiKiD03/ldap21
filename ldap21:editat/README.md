# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


 * **edtasixm06/ldap21:editat** Servidor LDAP base inicial amb la base de dades edt.org

S'ha fet el següent:
* Generar un sol fitxer ldif anomenat edt.org.ldif
* Afegir en el fitxer dos usuaris i una ou nova inventada.
* Modificar el fitxer edt.org.ldif modificant dn dels usuaris
* Utilitzant en lloc del CN el UID per identificarl-los.
* Configurar el password de Manager que sigui 'secret' pero encriptat (posar-hi) un comentari per indicar quien es de cara a estudiar).
* Afegir el fitxer de configuració client.
* Propagar el port amb -p -P
* Editar els dos README, en el general afegir que tenim una nova imagetge. En el de la imatge ldap21:editat descriure els canvis i les ordres per posar-lo en marxa.



```
docker network create hisx2
docker build -t edtasixm06/ldap21:base .

docker run --rm --name ldap.edt.org -h ldap.edt.org --net hisx2 -p 389:389 -d edtasixm06/ldap21:base

docker ps

ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
``` 


