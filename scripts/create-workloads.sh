#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=../kubeconfig.yaml

# Create workloads
cd workloads
tanzu workload apply -n default -y
tanzu workload apply -f workload-dev.yaml -n dev -y
tanzu workload apply -f workload-supplychain.yaml -n supplychain -y
