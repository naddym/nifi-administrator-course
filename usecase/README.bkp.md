# Airports Dataflow Usecase

A complex nifi dataflow which can pull data from `ourairports.com`, performs data (transformation/enrichment/filtering) and routes to appropriate destinations such as Hadoop, Kafka, Postgres, Elasticsearch ( for data insights & visualization in Kibana ).

## Deploy ecosystem stack

Clone the repository and checkout usecase

```shell
git clone https://github.com/naddym/nifi-course.git
cd usecase
```

Deploy stack with docker-compose

```shell
sudo docker-compose up
```

## Changes to Containers

Following changes are needed by dataflow to store airports data.

### Hadoop

Get into Hadoop's namenode container

```shell
sudo docker exec -it namenode bash

# listing existing files in hadoop
hdfs dfs -ls /

# creating /user/nifi directory for storing airports data
hdfs dfs -mkdir -p /user/nifi
```

### Kafka

Get into Kafka container

```shell
sudo docker exec -it kafka bash

# cd into user directory of kafka
cd /opt/kafka

# create topics
# closed topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic closed --replication-factor 1 --partitions 1
# heliport topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic heliport --replication-factor 1 --partitions 1
# large_airport topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic large_airport --replication-factor 1 --partitions 1
# medium_airport topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic medium_airport --replication-factor 1 --partitions 1
# seaplane_base topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic seaplane_base --replication-factor 1 --partitions 1
# small_airport topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic small_airport --replication-factor 1 --partitions 1
# ballonport topic
./bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic ballonport --replication-factor 1 --partitions 1
```
### Postgres DB

Get into Postgres container

```shell
sudo docker exec -it postgres bash

# connecting to postgres
psql -U postgres

# creating table countries used for country lookup from nifi
CREATE TABLE countries (
id INT,
code VARCHAR(50),
name VARCHAR(50),
continent VARCHAR(50),
wikipedia_link VARCHAR(100),
keywords VARCHAR(100),
PRIMARY KEY (id)
);

# importing countries.csv data into countries table.
COPY countries(id,code,name,continent,wikipedia_link,keywords)
FROM '/countries.csv'
CSV HEADER DELIMITER ','
;

# creating table airports for storing finalized data from nifi
CREATE TABLE AIRPORTS (
    ID INT PRIMARY KEY NOT NULL,
    IDENT TEXT NOT NULL,
    TYPE TEXT NOT NULL,
    NAME TEXT NOT NULL,
    LATITUDE_DEG DECIMAL,
    LONGITUDE_DEG DECIMAL,
    ELEVATION_FT INT,
    CONTINENT TEXT,
    ISO_COUNTRY TEXT,
    ISO_REGISON TEXT,
    MUNICIPALITY TEXT,
    SCHEDULED_SERVICE TEXT,
    GPS_CODE TEXT,
    IATA_CODE TEXT,
    LOCAL_CODE TEXT,
    HOME_LINK TEXT,
    KEYWORDS TEXT,
    FREQUENCY_MHZ TEXT,
    SURFACE_AREA_FT TEXT,
    SURFACE_TYPE TEXT,
    COUNTRY_NAME TEXT
);
```