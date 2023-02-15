#!/bin/sh -e

UID=1000
GID=1000
# data persistence mount location for the compose services
VOLUME_DATA_PATH=/home/ubuntu/data

# create nifi-1 host mounts
mkdir -p ${VOLUME_DATA_PATH}/nifi-1/conf
mkdir -p ${VOLUME_DATA_PATH}/nifi-1/flowfile_repository
mkdir -p ${VOLUME_DATA_PATH}/nifi-1/content_repository
mkdir -p ${VOLUME_DATA_PATH}/nifi-1/database_repository
mkdir -p ${VOLUME_DATA_PATH}/nifi-1/provenance_repository
mkdir -p ${VOLUME_DATA_PATH}/nifi-1/state

# create nifi-ca host mounts
mkdir -p ${VOLUME_DATA_PATH}/nifi-ca

# create nifi-registry host mounts
mkdir -p ${VOLUME_DATA_PATH}/nifi-registry/certs
mkdir -p ${VOLUME_DATA_PATH}/nifi-registry/database
mkdir -p ${VOLUME_DATA_PATH}/nifi-registry/flow_storage
mkdir -p ${VOLUME_DATA_PATH}/nifi-registry/extension_bundles

# assign non-root permissions to nifi-1
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-1/conf
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-1/flowfile_repository
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-1/content_repository
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-1/database_repository
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-1/provenance_repository
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-1/state

# assign non-root permissions to nifi-ca
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-ca

# assign non-root permissions to nifi-registry
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-registry/certs
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-registry/database
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-registry/flow_storage
chown ${UID}:${GID} -R ${VOLUME_DATA_PATH}/nifi-registry/extension_bundles

# generate self-signed certificate and private key for SSL/TLS communication 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx/nginx.key -out ./nginx/nginx.crt -subj "/C=IN/ST=Karnataka/L=Bangalore/O=NiFi/OU=Apache/CN=nifi.learning.com"

# Bring up compose services
#sudo docker-compose up

# Bring down compose services
# docker-compose down --volumes

# Bring down compose services by removing all images/volumes used
# docker-compose down --rmi all --volumes