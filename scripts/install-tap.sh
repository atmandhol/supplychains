#!/usr/bin/env bash
set -eo pipefail
CURRENT=$PWD

export KUBECONFIG=kubeconfig.yaml

# Install cluster essentials
kapp deploy -a kapp-controller -n kube-system -f https://github.com/vmware-tanzu/carvel-kapp-controller/releases/latest/download/release.yml -y
kapp deploy -a secretgen-controller -n kube-system -f https://github.com/vmware-tanzu/carvel-secretgen-controller/releases/latest/download/release.yml -y

# Install TAP and Supplychain Packages
kubectl create ns tap-install || true
kubectl create ns dev || true
kubectl create ns supplychain || true

ytt -f cluster --data-values-file values.yaml | kapp deploy -a tap-installation -c -f- --yes

kubectl label ns default apps.tanzu.vmware.com/tap-ns=""
kubectl label ns dev apps.tanzu.vmware.com/tap-ns=""
kubectl label ns supplychain apps.tanzu.vmware.com/tap-ns=""

ytt -f namespace --data-values-file values.yaml | kapp deploy -a default-ns-setup -n default -c -f- --yes
ytt -f namespace --data-values-file values.yaml | kapp deploy -a dev-ns-setup -n dev -c -f- --yes
ytt -f namespace --data-values-file values.yaml | kapp deploy -a supplychain-ns-setup -n supplychain -c -f- --yes