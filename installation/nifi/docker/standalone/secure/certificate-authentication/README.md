# Running NiFi securely

Following pre-requisite is required before running the stack
- Install [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/)

#### Running `ls`

```
├── CN=nadeem, OU=NIFi
├── node-1
├── authorizers.xml
└── docker-compose.yml
```

#### Start NiFi nodes

```shell
docker-compose up
```

#### Import certificate to browser
Mozilla Firefox -> Settings -> Privacy & Security section -> Certificates (view certificates)

Import `nifi-cert.pem` (CA certificate) and copy `keyStorePassword` from config.json (password of the certificate generated)

#### Navigate to canvas of any node

Node 1: `https://node-1:8443/nifi`

Accept user certificate

![cert-identity-dialog](./img/cert-identity-dialog.png)

![canvas](./img/canvas.png)

