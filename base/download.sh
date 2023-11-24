#!/bin/bash

YTT_VER="v0.46.0"
IMGPKG_VER="v0.39.0"
KBLD_VER="v0.38.0"
KAPP_VER="v0.59.0"
VENDIR_VER="v0.35.0"
KCTRL_VER="v0.48.1"
CRANE_VER=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')
YQ_VER="v4.2.0"
JQ_VER="1.7"
KUBECTL_VER="1.27.4"
KUSTOMIZE_VER="5.1.0"

mkdir -p bin

# TODO: In the production image creation scripts, don't skip the checksum verification like I have done here.
install() {
  set -euo pipefail

  echo "Downloading ytt..."
  wget https://github.com/carvel-dev/ytt/releases/download/$YTT_VER/ytt-linux-amd64
  mv ytt-linux-amd64 bin/ytt
  chmod +x bin/ytt

  echo "Downloading imgpkg..."
  wget https://github.com/carvel-dev/imgpkg/releases/download/$IMGPKG_VER/imgpkg-linux-amd64
  mv imgpkg-linux-amd64 bin/imgpkg
  chmod +x bin/imgpkg

  echo "Downloading kbld..."
  wget https://github.com/carvel-dev/kbld/releases/download/$KBLD_VER/kbld-linux-amd64
  mv kbld-linux-amd64 bin/kbld
  chmod +x bin/kbld

  echo "Downloading kapp..."
  wget https://github.com/carvel-dev/kapp/releases/download/$KAPP_VER/kapp-linux-amd64
  mv kapp-linux-amd64 bin/kapp
  chmod +x bin/kapp

  echo "Downloading vendir..."
  wget https://github.com/carvel-dev/vendir/releases/download/$VENDIR_VER/vendir-linux-amd64
  mv vendir-linux-amd64 bin/vendir
  chmod +x bin/vendir

  echo "Downloading kctrl..."
  wget https://github.com/carvel-dev/kapp-controller/releases/download/$KCTRL_VER/kctrl-linux-amd64
  mv kctrl-linux-amd64 bin/kctrl
  chmod +x bin/kctrl

  echo "Downloading crane..."
  curl -sL "https://github.com/google/go-containerregistry/releases/download/${CRANE_VER}/go-containerregistry_Linux_x86_64.tar.gz" > go-containerregistry.tar.gz
  tar -zxvf go-containerregistry.tar.gz -C bin/ crane
  rm go-containerregistry.tar.gz
  chmod +x bin/crane

  echo "Downloading yq..."
  wget https://github.com/mikefarah/yq/releases/download/$YQ_VER/yq_linux_amd64 -O bin/yq && chmod +x bin/yq

  echo "Downloading jq..."
  wget https://github.com/jqlang/jq/releases/download/jq-$JQ_VER/jq-linux-amd64 -O bin/jq && chmod +x bin/jq
  
  echo "Downloading kubectl..."
  wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl -O bin/kubectl && chmod +x bin/kubectl

  echo "Downloading kustomize..."
  curl -sL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz" > kustomize.tar.gz
  tar -zxvf kustomize.tar.gz -C bin/ kustomize
  rm kustomize.tar.gz
  chmod +x bin/kustomize

}

install
