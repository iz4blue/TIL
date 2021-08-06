#!/bin/bash

# https://minikube.sigs.k8s.io/docs/start/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# https://github.com/kubernetes/minikube/issues/7511
mkdir -p /var/tmp/hostpath-provisioner
mkdir /tmp/hostpath-provisioner
sudo mount --bind /var/tmp/hostpath-provisioner /tmp/hostpath-provisioner

echo '/var/tmp/hostpath-provisioner /tmp/hostpath-provisioner none defaults,bind 0 0' >> /etc/fstab
