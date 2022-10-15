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

wget https://dl.k8s.io/${K8S_VER}/kubernetes-server-linux-${ARCH}.tar.gz && \
tar zxf kubernetes-server-linux-${ARCH}.tar.gz && \
cd kubernetes/server/bin && \
mv kube-apiserver kube-controller-manager kube-scheduler /k8s && \
mv kubelet kube-proxy kubectl /k8s && \
rm -rf /kubernetes-server-linux-${ARCH}.tar.gz
