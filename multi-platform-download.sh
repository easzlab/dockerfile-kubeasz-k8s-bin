#!/bin/sh
mkdir -p /k8s
ARC=$(uname -m)
ARCH="amd64"

case "$ARC" in
  x86_64)
      ARCH="amd64"
      ;;
  aarch64)
      ARCH="arm64"
      ;;
  ?)
      echo "error: not supported platform right now, exit"
      exit 1
      ;;
esac

wget https://dl.k8s.io/${K8S_VER}/kubernetes-node-linux-${ARCH}.tar.gz && \
tar zxf kubernetes-node-linux-${ARCH}.tar.gz && \
mv kubernetes/node/bin/kubelet kubernetes/node/bin/kubectl /k8s && \
rm -rf kubernetes-node-linux-${ARCH}.tar.gz kubernetes
