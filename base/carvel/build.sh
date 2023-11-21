#!/bin/bash
./download.sh

docker build -t carvel-base .
docker tag carvel-base $REGISTRY_REPO/carvel-base
docker push $REGISTRY_REPO/carvel-base