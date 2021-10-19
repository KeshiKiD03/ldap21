# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

PRACTICA LDAP 21 SCHEMES


Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona

**Aaron Andal**

**Context:** Es demana registrar la participació d'un concurs de ball d'un programa de TV Coreà. 

Es vol saber:
   
   * Saber quins usuaris son **idols** de música "kpop" (Pop Coreà) i quins son **treballadors**,
   
   * Si son **idols** en quin **grup** pertanyen.

   * Si son **treballadors** en quina companyia de TV.
   
   * Es vol tenir constancia de la **pàgina web** del programa, pot contenir més d'una **pàgina web**.

   * Es demana també una foto de cada **usuari**.  

**keshikid03/ldap21:practica** S'afegeix un diversos ObjectClass i atributs definis per un sistema schema: kpop.schema.

### objectClass

   * *x-Person*: Com a Structural, derivat de InetOrgPerson.
   * *x-Idol*: Com a Structural.
   * *x-Worker*: Com a Structural.
   * *x-TV*: Com a Auxiliar

### attributeTypes

Exemples d'atributs que te el kpop.schema:

# EN EDICIÓN

   * *IdolKpop*: Atribut que indica que si l'usuari es un idol o un treballador, (un boleà).

   * *NomPrograma*: Nom del programa de TV.

   * *NomGrup*: Nom del grup-idol.

   * *Puntuacio*: Atribut numèric que indica la puntació de l'actuació del grup.

   * *Web*: URL de la PAG web.

   * *Photo*: Foto JPG de l'usuari. Pot ser muti-value.

   * *Documents*: Atribut binari per contenir documents de l'usuari.

   * **:

```
$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hsix -p 389:389 -it keshikid03/ldap21:practica /bin/bash

$ docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/phpldapadmin:20
```


