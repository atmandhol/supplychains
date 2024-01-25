#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=../kubeconfig.yaml

# Create workloads
cd workloads
tanzu workload apply -y
