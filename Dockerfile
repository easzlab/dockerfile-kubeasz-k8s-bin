# Download kubernetes binaries needed by 'kubeasz'
# @author:  gjmzj
# @repo:    https://github.com/easzlab/dockerfile-kubeasz-k8s-bin
# @ref:     https://github.com/easzlab/kubeasz

FROM alpine:3.12

ENV K8S_VER=v1.25.2

COPY multi-platform-download.sh .

RUN sh -x ./multi-platform-download.sh

COPY --from=k8s.gcr.io/kube-apiserver:v1.25.2 /usr/local/bin/kube-apiserver /k8s/
COPY --from=k8s.gcr.io/kube-controller-manager:v1.25.2 /usr/local/bin/kube-controller-manager /k8s/
COPY --from=k8s.gcr.io/kube-proxy:v1.25.2 /usr/local/bin/kube-proxy /k8s/
COPY --from=k8s.gcr.io/kube-scheduler:v1.25.2 /usr/local/bin/kube-scheduler /k8s/

CMD [ "sleep", "360000000" ]
