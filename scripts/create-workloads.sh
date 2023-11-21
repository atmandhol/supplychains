#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=almsc-kubeconfig.yaml

# Create workloads
kapp deploy -a workloads -f workloads/ -y