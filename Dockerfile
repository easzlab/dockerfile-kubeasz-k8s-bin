# Download kubernetes binaries needed by 'kubeasz'
# @author:  gjmzj
# @repo:    https://github.com/easzlab/dockerfile-kubeasz-k8s-bin
# @ref:     https://github.com/easzlab/kubeasz

FROM alpine:3.12

ARG K8S_VER=v1.25.3

COPY multi-platform-download.sh .

RUN sh -x ./multi-platform-download.sh

CMD [ "sleep", "360000000" ]
