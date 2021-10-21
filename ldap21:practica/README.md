# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

PRACTICA LDAP 21 SCHEMES


Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona

**Aaron Andal**

**Context:** Es demana registrar la participació d'un programa de TV de música i ball Coreana.

Es vol saber:
   
   * Saber quines persones son **idols** de música "kpop" (Pop Coreà) i quins son **treballadors**,
   
   * Si son **idols** en quin **grup** pertanyen.

   * Si son **treballadors** en quina companyia de TV.
   
   * Es vol tenir constancia de la **pàgina web** de les persones que hi participen, pot contenir més d'una **pàgina web** o cap.

   * Es demana també una foto de cada **persona**.  

**keshikid03/ldap21:practica** S'afegeix un diversos ObjectClass i atributs definis per un sistema schema: kpop.schema.

### objectClass

   * *x-Person*: Com a Structural, derivat de inetOrgPerson (Internet Org Person).
   * *x-Idol*: Com a Auxiliary, derivat de TOP.
   * *x-Worker*: Com a Auxiliary, derivat de TOP.
   * *x-TV*: Com a Structural, derivat de posixGroup (Grup de Unix).

### attributeTypes

Exemples d'atributs que te el kpop.schema:

# x-Persona

   * *x-DNI*: Dni de la persona. Syntax .15 limitat a 9 caràcters.
   
   * *x-Photo*: Foto JPG de l'usuari. Pot ser muti-value. Syntax .28 .

   * *x-esIdol*: Atribut que indica que si l'usuari es un idol o un treballador, (un boleà). Syntax .7 .
   
   * *x-Web*: Pàgina web de la persona. Pot contenir més 1. Syntax .26 .


# x-Idol


   * *x-nomGrup*: Nom del grup. Syntax .15 .
   
   * *x-dataDebut*: Data del debut del grup. Syntax .15 limitat a 10 caràcters per al format DD-MM-AAAA.
   
   * *x-Documents*: Atribut binari per contenir documents de l'idol. Syntax .5 .
   
# x-Worker

   * *x-tipo*: Rang del treballador. Syntax .15 .

   * *x-CVpdf*: Atribut binari per contenir documents de l'usuari. Syntax .5 .

   * *x-cadenaTV*: Grup del treballador. Syntax .15 .

   * *x-sou*: Integer per saber el sou del treballador. Syntax .27 .
   
# x-TV

   * *x-codiTV*: CIF de la empresa de TV. Syntax .15 limitat a 9 caràcters.

   * *x-NomTV*: Nom de la empresa de TV. Syntax .15 .

   * *x-Adreca*: Direcció de la empresa de TV. Syntax .15 .

   * *x-Telefon*: Integer per saber el sou del treballador. Syntax .27 .



```

# kpop.schema
# ----------------

## x-Persona
# x-DNI
# x-Photo
# x-Web


attributetype (1.1.2.1.1 
	NAME 'x-DNI'
	DESC 'DNI de la persona'
 	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15{9}
  	SINGLE-VALUE )
  
attributetype (1.1.2.1.2 
	NAME 'x-Photo'
   	DESC 'Fotografia  de la persona'
   	SYNTAX 1.3.6.1.4.1.1466.115.121.1.28 )
      
attributetype (1.1.2.1.3 
	NAME 'x-esIdol'
  	DESC 'Saber si es Idol o no'
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.7 )
  
attributetype ( 1.1.2.1.4 
	NAME 'x-Web'
 	DESC 'Pagina(s) web de la Persona'
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.26 )

objectclass (1.1.2.2.1
	NAME 'x-Persona'
	DESC 'Persones'
   	SUP  inetOrgPerson
   	STRUCTURAL
   	MUST ( x-DNI $ x-esIdol )
   	MAY  ( x-Photo $ x-Web ) )




### x-Idol
#
# 
# x-nomGrup
# x-dataDebut
# x-Documents
#
# ---------------------------------------------------------

attributetype (1.1.2.2.1 
	NAME 'x-nomGrup'
	DESC 'Grup de lIdol'
	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 )

attributetype (1.1.2.2.2 
	NAME 'x-dataDebut'
  	DESC 'Data Debut'
  	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15{10} )
  	
attributetype ( 1.1.2.2.3
	NAME 'x-Documents'
	DESC 'Documents del Idol'
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.5 )


objectclass (1.1.2.2.2
	NAME 'x-Idol'
   	DESC 'Idol'
   	SUP  TOP
   	AUXILIARY
   	MUST x-nomGrup 
   	MAY ( x-dataDebut $ x-Documents ) )



# x-Worker
#
# 
# x-tipo
# x-CVpdf
# x-Sou
# x-cadenaTV
#
# ---------------------------------------------------------


attributetype (1.1.2.3.1
	NAME 'x-tipo'
	DESC 'Tipus de treballador'
  	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15
  	SINGLE-VALUE )

attributetype (1.1.2.3.2 
	NAME 'x-CVpdf'
   	DESC 'CV format binary'
   	SYNTAX 1.3.6.1.4.1.1466.115.121.1.5)

attributetype (1.1.2.3.3 
	NAME 'x-cadenaTV'
  	DESC 'Cadena de TV perteneix'
  	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15
  	SINGLE-VALUE )
   
attributetype (1.1.2.3.4
	NAME 'x-Sou'
   	DESC 'Sou'
   	SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
   	SINGLE-VALUE )   
   
objectclass (1.1.2.2.3 
	NAME 'x-Worker'
   	DESC 'Worker'
   	SUP  TOP
   	AUXILIARY
   	MUST ( x-CVpdf $ x-cadenaTV)
   	MAY ( x-tipo $ x-sou ) )


### x-TV
# x-codiTV
# x-NomTV
# x-Adreca
# x-Telefon
# -------------------------------- 

attributetype (1.1.2.4.1 
	NAME 'x-codiTV'
	DESC 'CIF TV'
 	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15{9}
  	SINGLE-VALUE )

attributetype (1.1.2.4.2 
	NAME 'x-NomTV'
  	DESC 'Nom de la TV'
  	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15
  	SINGLE-VALUE )
  
attributetype (1.1.2.4.3 
	NAME 'x-Adreca'
  	DESC 'Adreca de TV'
  	EQUALITY caseIgnoreMatch
  	SUBSTR caseIgnoreSubstringsMatch
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 )
  
attributetype (1.1.2.4.4 
	NAME 'x-Telefon'
  	DESC 'Telefon de TV'
  	SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
  	SINGLE-VALUE ) 


objectclass (1.1.2.2.4 
	NAME 'x-TV'
   	DESC 'Cadena de TV'
   	SUP  posixGroup
   	STRUCTURAL
   	MUST ( x-codiTV $ x-nomTV ) 
   	MAY ( x-Adreca $ x-Telefon ) )


```

**En una carpeta a part posem tots els fitxers i fotos**

**Modificar el slapd.conf (include kpop.schema)**

```
$ vim ./slapd.conf
```

**Crear una imatge nova a partir del Dockerfile**

```
$ docker build -t keshikid03/ldap21:practica .
```

**Executar docker en Mode Detach (Ha d'esta el -d0 en /usr/sbin/slapd)**

```
$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d keshikid03/ldap21:practica
```

**Executar docker en Mode Interactiu (No cal el -d0 en /usr/sbin/slapd)**

```
$ docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -d keshikid03/ldap21:practica
```


**Executar el startup.sh (Si accedim en mode Interactiu no executa dimoni)**

```

$ bash startup.sh
```

**Afegir els usuaris creats en el fitxer add-kpop-idols.ldif predefinits segons el kpop.schema**
```
$ ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-idols.ldif
```

**Afegir els workers creats en el fitxer add-kpop-workers.ldif predefinits segons el kpop.schema**
```
$ ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-idols.ldif
```

**Afegir els grups creats en el fitxer add-kpop-grups.ldif predefinits segons el kpop.schema**
```
$ ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-idols.ldif
```

**Afegir la TV creats en el fitxer add-kpop-tv.ldif predefinits segons el kpop.schema**
```
$ ldapmodify -x -D 'cn=Manager,dc=edt,dc=org' -w secret -f add-kpop-idols.ldif
```

**Baixar-nos el PHPLDAPADMIN per a una gestió grafica i veure els resultats**
```
$ docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --net 2hisx -p 80:80 -d edtasixm06/phpldapadmin:20
```

**Iniciem per exemple amb les credencials de Jennie: uid=jennie,ou=kpop,dc=edt,dc=org**




