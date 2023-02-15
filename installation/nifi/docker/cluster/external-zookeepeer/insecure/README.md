# Running NiFi cluster of two nodes insecurely

Following pre-requisite is required before running the stack
- Install [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/)

#### Start NiFi nodes

```shell
docker-compose up
```

#### Navigate to canvas of any node

Node 1: `http://<ip-address>:8080/nifi`, Node 2: `http://<ip-address>:8081/nifi`

![canvas](./img/canvas.png)


![cluster-page](./img/cluster-page.png)
