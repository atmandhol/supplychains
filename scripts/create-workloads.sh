#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=kubeconfig.yaml

# Create workloads
kapp deploy -a workloads -f workloads/ -y