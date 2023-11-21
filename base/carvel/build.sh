#!/bin/bash
./download.sh

docker build -t carvel-base .
docker tag carvel-base us-east4-docker.pkg.dev/adhol-playground/image-base/carvel-base
docker push us-east4-docker.pkg.dev/adhol-playground/image-base/carvel-base