FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ENV K8S_LATEST_VERSION="v1.15.3"
ENV KUBECONFIG=/.kube/config

ENV K8S_SERVER="K8S_SERVER"
ENV K8S_CLUSTER_NAME="K8S_CLUSTER_NAME"
ENV K8S_NAMESPACE="K8S_NAMESPACE"
ENV K8S_USERNAME="K8S_USERNAME"
ENV K8S_CONTEXT="K8S_CONTEXT"
ENV K8S_TOKEN="K8S_TOKEN"

ENV APP_NAME="APP_NAME"
ENV APP_POD_REPLICA_NUMBER="APP_POD_REPLICA_NUMBER"
ENV DOCKER_REGISTRY_URL="DOCKER_REGISTRY_URL"
ENV APP_IMAGE_NAME="APP_IMAGE_NAME"
ENV APP_GIT_TAG="APP_GIT_TAG"
ENV APP_CONTAINER_PORT="APP_CONTAINER_PORT"
ENV APP_PATH="APP_PATH"
ENV APP_NODE_PORT="APP_NODE_PORT"
ENV K8S_SERVICE_TYPE="K8S_SERVICE_TYPE"

ENV K8S_CLUSTER_URL="K8S_CLUSTER_URL"

## Install envsubst
RUN apt-get update \
&& apt-get -y install apt-utils \
&& apt-get install -y ca-certificates \
&& apt-get -y install gettext-base \
&& apt-get -y install curl


## Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/${K8S_LATEST_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN set -x \
&& update-ca-certificates \
&& chmod +x /usr/local/bin/kubectl \
## Create non-root user (with a randomly chosen UID/GUI).
&& adduser kubectl --disabled-login --uid 2342 --home  /.kube \
## Basic check it works.
&& kubectl version --client

USER kubectl

## Copy kubeconfig template
COPY ./.kube /.kube
COPY ./scripts /apps

WORKDIR /apps

ENTRYPOINT ["./create-kubeconfig.sh"]
