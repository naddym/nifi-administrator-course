# Running NiFI securely

By default, NiFi runs securely (from 1.14.0 onwards). Following instructions demonstrates openid-connect authentication mechanism. We will use LDAP as Identity Provider.

### Download tarball from Apache NiFi site

```shell
wget https://archive.apache.org/dist/nifi/1.15.3/nifi-1.15.3-bin.tar.gz
tar -zxf nifi-1.15.3-bin.tar.gz
mv nifi-1.15.3 nifi
```

### Download NiFi Toolkit tarball from Apache NiFi site

NiFi Toolkit is helpful to automatically generate the required keystores, truststore and relevant configuration files. This is especially useful for securing multiple NiFi nodes, which can be tedious and error-prone process.

```shell
wget https://archive.apache.org/dist/nifi/1.15.3/nifi-toolkit-1.15.3-bin.tar.gz
tar -zxf nifi-toolkit-1.15.3-bin.tar.gz
mv nifi-toolkit-1.15.3 nifi-toolkit
```

### Generating keystore, truststore for server

```shell
cd nifi-toolkit
bin/tls-toolkit.sh standalone -n 'localhost'

```

Running `ls` will result in below structure

```
├── LICENSE
├── NOTICE
├── bin
├── classpath
├── conf
├── lib
├── localhost
├── nifi-cert.pem
└── nifi-key.key
```

### Copy keystore, trustore

```shell
mkdir /home/ubuntu/nifi/certs
cp localhost/keystore.jks /home/ubuntu/nifi/certs/keystore.jks
cp localhost/truststore.jks /home/ubuntu/nifi/certs/truststore.jks

# copy keystore and truststore passwords from localhost/nifi.properties file
```

### Edit nifi.properties file

```shell
vi conf/nifi.properties

# web properties #

nifi.web.https.host=
nifi.web.https.port=8443

# security properties #
nifi.security.keystore=./certs/keystore.jks
nifi.security.keystoreType=jks
# passwords to copy from nifi-toolkit/localhost/nifi.properties file
nifi.security.keystorePasswd=hdPCkHa89MxuVOjFNE/eK4CgGSWjNE+af5USR0bIUU4
nifi.security.keyPasswd=hdPCkHa89MxuVOjFNE/eK4CgGSWjNE+af5USR0bIUU4
nifi.security.truststore=./certs/truststore.jks
nifi.security.truststoreType=jks
# passwords to copy from nifi-toolkit/localhost/nifi.properties file
nifi.security.truststorePasswd=T1LMuVzeHHsSvTEmOBoZ9ZY623mD38/VPpIiXqP1Hzg
nifi.security.user.authorizer=managed-authorizer
nifi.security.user.login.identity.provider=ldap-provider
```

### Edit login-identity-providers.xml file

Before you configure, ensure you have done the [setup](./ldap-setup.md) of ldap server. This is crucial otherwise NiFi won't perform authentication. Also ensure to open ldap port `389` if you are connecting externally as firewall rules could block it.

```xml
<!-- edit ldap-provider identifier section to look like below -->

<provider>
    <identifier>ldap-provider</identifier>
    <class>org.apache.nifi.ldap.LdapProvider</class>
    <property name="Authentication Strategy">SIMPLE</property>

    <property name="Manager DN">cn=admin,dc=nifi</property>
    <property name="Manager Password">nifi</property>

    <property name="TLS - Keystore"></property>
    <property name="TLS - Keystore Password"></property>
    <property name="TLS - Keystore Type"></property>
    <property name="TLS - Truststore"></property>
    <property name="TLS - Truststore Password"></property>
    <property name="TLS - Truststore Type"></property>
    <property name="TLS - Client Auth"></property>
    <property name="TLS - Protocol"></property>
    <property name="TLS - Shutdown Gracefully"></property>
    
    <property name="Referral Strategy">FOLLOW</property>
    <property name="Connect Timeout">10 secs</property>
    <property name="Read Timeout">10 secs</property>

    <property name="Url">ldap://hostname:389</property>
    <property name="User Search Base">dc=nifi</property>
    <property name="User Search Filter">cn={0}</property>

    <property name="Identity Strategy">USE_DN</property>
    <property name="Authentication Expiration">12 hours</property>
</provider>
```

### Edit authorizers.xml file

```xml
<!-- edit <userGroupProvider> section to look like below -->

<userGroupProvider>
    <identifier>file-user-group-provider</identifier>
    <class>org.apache.nifi.authorization.FileUserGroupProvider</class>
    <property name="Users File">./conf/users.xml</property>
    <property name="Legacy Authorized Users File"></property>

    <property name="Initial User Identity 1">cn=nadeem,dc=nifi</property>
</userGroupProvider>

<!-- edit <accessPolicyProvider> section to look like below -->

<accessPolicyProvider>
    <identifier>file-access-policy-provider</identifier>
    <class>org.apache.nifi.authorization.FileAccessPolicyProvider</class>
    <property name="User Group Provider">file-user-group-provider</property>
    <property name="Authorizations File">./conf/authorizations.xml</property>
    <property name="Initial Admin Identity">cn=nadeem,dc=nifi</property>
    <property name="Legacy Authorized Users File"></property>
    <property name="Node Identity 1"></property>
    <property name="Node Group"></property>
</accessPolicyProvider>
```

### Start NiFi

```shell
cd nifi/bin
./nifi.sh start
```

### Navigate to canvas

`https://localhost:8443/nifi`

`Accept the Risk and Continue` to trust the self-signed ca