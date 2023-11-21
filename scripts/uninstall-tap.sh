#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=kubeconfig.yaml

kapp delete -a tap-installation --yes
