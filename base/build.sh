#!/bin/bash
./download.sh

docker build -t big-base .
docker tag big-base $REGISTRY_REPO/big-base
docker push $REGISTRY_REPO/big-base