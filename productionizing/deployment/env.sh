#!/bin/sh

# before running the compose, it is necessary to provide
# following environment variables
export VOLUME_DATA_PATH=/home/ubuntu/data
# change the discovery url if you are using other than google authorization server
export NIFI_OIDC_CLIENT_DISCOVERY_URL=https://accounts.google.com/.well-known/openid-configuration
# provide your client id
export NIFI_OIDC_CLIENT_ID=
# provide your client secret
export NIFI_OIDC_CLIENT_SECRET=
# change the discovery url if you are using other than google authorization server
export NIFI_REGISTRY_OIDC_CLIENT_DISCOVERY_URL=https://accounts.google.com/.well-known/openid-configuration
# provide your client id
export NIFI_REGISTRY_OIDC_CLIENT_ID=
# provide your client secret
export NIFI_REGISTRY_OIDC_CLIENT_SECRET=