#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=kubeconfig.yaml

# Install Catalog
kapp deploy -a catalog -f catalog/ -y --dangerous-allow-empty-list-of-resources
