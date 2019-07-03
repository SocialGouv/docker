#!/usr/bin/env sh

/apps/create-kubeconfig.sh

python3 ./killer.py
