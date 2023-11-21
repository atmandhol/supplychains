# Carvel base

Base image that can be used in tekton pipelines and tasks for running Carvel tools among other things.

This base image has the following tools:
* ytt
* imgpkg
* vendir
* kapp
* kbld
* kctrl
* crane
* yq
* jq

## Building the image

```bash
# Check the versions of the CLI to download in download.sh.

# Set the registry URL that you have write access to in REGISTRY_REPO env var
export REGISTRY_REPO=us-east4-docker.pkg.dev/adhol-playground/image-base
./build.sh
```

## Test
```bash
docker run -it $REGISTRY_REPO/carvel-base:latest ytt -h
docker run -it $REGISTRY_REPO/carvel-base:latest kapp -h
docker run -it $REGISTRY_REPO/carvel-base:latest kctrl -h
docker run -it $REGISTRY_REPO/carvel-base:latest yq -h
docker run -it $REGISTRY_REPO/carvel-base:latest jq -h
docker run -it $REGISTRY_REPO/carvel-base:latest crane -h
docker run -it $REGISTRY_REPO/carvel-base:latest imgpkg -h
```

## Usage

```bash
docker pull $REGISTRY_REPO/carvel-base:latest
```