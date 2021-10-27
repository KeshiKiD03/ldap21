# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


 * **edtasixm06/ldap21:base** Servidor LDAP base inicial amb la base de dades edt.org

```
docker network create hisx2
docker build -t edtasixm06/ldap21:base .

docker run --rm --name ldap.edt.org -h ldap.edt.org --net hisx2 -d edtasixm06/ldap21:base

docker ps

ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
``` 


