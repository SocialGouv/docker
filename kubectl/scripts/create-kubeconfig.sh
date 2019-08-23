#!/bin/sh

envsubst < /.kube/config > /.kube/config
export KUBECONFIG=/.kube/config

