# Running NiFi cluster of two nodes insecurely

By default, NiFi runs securely (from 1.14.0 onwards). In order to run insecurely, we have to make following changes.

### Download tarball from Apache NiFi site

```shell
wget https://archive.apache.org/dist/nifi/1.15.3/nifi-1.15.3-bin.tar.gz
tar -zxf nifi-1.15.3-bin.tar.gz
mv nifi-1.15.3 nifi
cd nifi
```

### Download Zookeeper tarball

Since we will be running zookeeper externally, we are required to install it separately.

```shell
wget https://archive.apache.org/dist/zookeeper/zookeeper-3.5.7/apache-zookeeper-3.5.7-bin.tar.gz
tar -zxf apache-zookeeper-3.5.7-bin.tar.gz
mv apache-zookeeper-3.5.7-bin zookeeper
```

### Alias /etc/hosts file

Since Im using using AWS EC2 ubuntu machine for representing a NiFi node, we need to add them for communication between each other. Also, Node 1 will also be running a zookeeper. Both Node 1 & 2 will communicate with this zookeeper for knowing who is the primary and cluster coordinator.

```shell
sudo vi /etc/hosts

# add below entries
172.31.19.89 node-1
172.31.25.21 node-2
172.31.19.89 zookeeper-node
```

### Starting Zookeeper

```shell
cd zookeeper

# configure zookeeper properties
cp conf/zoo_sample.cfg conf zoo.cfg

# start zookeeper
./bin/zkServer.sh start
```

### Edit nifi.properties file

#### Node 1

```shell
vi conf/nifi.properties

# Site to Site properties
nifi.remote.input.secure=false
nifi.remote.input.http.enabled=true

# web properties #
nifi.web.http.host=node-1   # <ip-address or hostname>
nifi.web.http.port=8080

nifi.web.https.host=
nifi.web.https.port=

# security properties #
nifi.sensitive.props.key=awesome_nifi

nifi.security.keystore=
nifi.security.keystoreType=
nifi.security.truststore=
nifi.security.truststoreType=
nifi.security.user.authorizer=
nifi.security.user.login.identity.provider=

# cluster node properties
nifi.cluster.is.node=true
nifi.cluster.node.address=node-1   # <ip-address or hostname>
nifi.cluster.node.protocol.port=9998

# zookeeper properties
nifi.zookeeper.connect.string=zookeeper-node:2181
```

#### Node 2

```shell
vi conf/nifi.properties

# Site to Site properties
nifi.remote.input.secure=false
nifi.remote.input.http.enabled=true

# web properties #
nifi.web.http.host=node-2   # <ip-address or hostname>
nifi.web.http.port=8080

nifi.web.https.host=
nifi.web.https.port=

# security properties #
nifi.sensitive.props.key=awesome_nifi

nifi.security.keystore=
nifi.security.keystoreType=
nifi.security.truststore=
nifi.security.truststoreType=
nifi.security.user.authorizer=
nifi.security.user.login.identity.provider=

# cluster node properties
nifi.cluster.is.node=true
nifi.cluster.node.address=node-2   # <ip-address or hostname>
nifi.cluster.node.protocol.port=9998

# zookeeper properties
nifi.zookeeper.connect.string=zookeeper-node:2181
```

### Edit state-management.xml file

Perform below step for each node

```xml
vi conf/state-management.xml

<!-- edit <cluster-provider> with <id>zk-provider</id> to look like below -->

<cluster-provider>
    <id>zk-provider</id>
    <class>org.apache.nifi.controller.state.providers.zookeeper.ZooKeeperStateProvider</class>
    <property name="Connect String">zookeeper-node:2181</property>
    <property name="Root Node">/nifi</property>
    <property name="Session Timeout">10 seconds</property>
    <property name="Access Control">Open</property>
</cluster-provider>
```

### Start NiFi on each node

```shell
cd nifi/bin
./nifi.sh start
```

### Navigate to canvas of any node

`http://<ip-address>:8080/nifi`

![canvas](./img/canvas.png)

![cluster-page](./img/cluster-page.png)
