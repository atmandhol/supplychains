# Big Base Image for Development

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
* git

## Building the image

```bash
# Check the versions of the CLI to download in download.sh.

# Set the registry URL that you have write access to in REGISTRY_REPO env var
export REGISTRY_REPO=us-east4-docker.pkg.dev/adhol-playground/image-base
./build.sh
```

## Test

Use `dive` CLI to check for the base image and tools inside it along with
```bash
dive $REGISTRY_REPO/big-base:latest
grype $REGISTRY_REPO/big-base:latest
```

```bash
docker run -it $REGISTRY_REPO/big-base:latest ytt -h
docker run -it $REGISTRY_REPO/big-base:latest kapp -h
docker run -it $REGISTRY_REPO/big-base:latest kctrl -h
docker run -it $REGISTRY_REPO/big-base:latest yq -h
docker run -it $REGISTRY_REPO/big-base:latest jq -h
docker run -it $REGISTRY_REPO/big-base:latest crane -h
docker run -it $REGISTRY_REPO/big-base:latest imgpkg -h
docker run -it $REGISTRY_REPO/big-base:latest git -h
docker run -it $REGISTRY_REPO/big-base:latest kubectl -h
docker run -it $REGISTRY_REPO/big-base:latest kustomize -h
```

## Usage

```bash
docker pull $REGISTRY_REPO/big-base:latest
```

## Sample public image
```bash
docker pull us-east4-docker.pkg.dev/adhol-playground/image-base/big-base:latest
```