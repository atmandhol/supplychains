## Building the image

```bash
# Check the versions of the CLI to download in download.sh.

# Set the registry URL that you have write access to in REGISTRY_REPO env var
export REGISTRY_REPO=us-east4-docker.pkg.dev/adhol-playground/image-base
./build.sh
```

## Usage

```bash
docker pull $REGISTRY_REPO/carvel-base:latest
```