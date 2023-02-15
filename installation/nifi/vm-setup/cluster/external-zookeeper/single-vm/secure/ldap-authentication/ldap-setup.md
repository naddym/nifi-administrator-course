# Running LDAP server

Follow below instructions to setup and run the LDAP server

## Pre-requisites

- Ensure you have docker and docker-compose installed

## Steps

### Running ldap server

```shell
docker run --name nifi-openldap --env LDAP_ORGANISATION="nifiorg" --env LDAP_DOMAIN="nifi" --env LDAP_ADMIN_PASSWORD="nifi" -p 389:389 -p 636:636 -d osixia/openldap
```

### Adding Users

Open vim editor with file name `user.ldif` and paste below users information

```shell
dn: cn=nadeem,dc=nifi
changetype: add
cn: nadeem
sn: 3
objectClass: top
objectClass: inetOrgPerson
userPassword: pass

dn: cn=naddym,dc=nifi
changetype: add
cn: naddym
sn: 3
objectClass: top
objectClass: inetOrgPerson
userPassword: pass
```

Next, copy th `user.ldif` to ldap docker

```shell
docker cp user.ldif nifi-openldap:/user.ldif
```

### Adding users to ldap server

```shell
docker exec nifi-openldap ldapadd -x -H ldap://localhost -D "cn=admin,dc=nifi" -w nifi -f /nadeem.ldif -ZZ
```

### Verifying if users are added

```shell
docker exec nifi-openldap ldapsearch -x -H ldap://localhost -b dc=nifi -D "cn=admin,dc=nifi" -w nifi
```