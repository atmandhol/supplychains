#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=almsc-kubeconfig.yaml

# Install Catalog
kapp deploy -a catalog -f catalog/ -y
