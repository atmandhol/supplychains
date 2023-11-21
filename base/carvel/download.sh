#!/bin/bash

YTT_VER=v0.46.0
IMGPKG_VER=v0.39.0
KBLD_VER=v0.38.0
KAPP_VER=v0.59.0
VENDIR_VER=v0.35.0
KCTRL_VER=v0.48.1

mkdir -p bin

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

}

install
