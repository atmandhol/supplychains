#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=../kubeconfig.yaml

# Create workloads
cd workloads
tanzu workload apply -f workload-supplychain.yaml -n supplychain -y
