#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=../kubeconfig.yaml

# Install Catalog
cd catalog
make
