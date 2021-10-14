# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


 * **edtasixm06/ldap21:editat** Servidor LDAP amb la base de dades edt.org
   S'ha fet el següent:

   * generar un sol fitxer ldif anomenat edt.org.ldif
   * afegir en el fitxer dos usuaris i una ou nova inventada.
   * modificar el fitxer edt.org.ldif  modificant dn dels usuaris
     utilitzant en lloc del cn el uid per identificar-los. 
   * configurar el password de Manager que sigui ‘secret’ però 
     encriptat (posar-hi un comentari per indicar quin és de cara a estudiar).
   * afegir el fitxer de configuració client.
   * propagar el port amb -p -P
   * editar els dos README, en el general afegir que tenim una nova imatge. 
     En el de la imatge ldap21:editat descriure els canvis i les ordres 
     per posar-lo en marxa.


```
docker network create hisx2
docker build -t edtasixm06/ldap21:editat .

docker run --rm --name ldap.edt.org -h ldap.edt.org --net hisx2 -p 389:389 -d edtasixm06/ldap21:base

docker ps

ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
``` 


