#!/bin/bash

# https://minikube.sigs.k8s.io/docs/start/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# https://github.com/kubernetes/minikube/issues/7511
mkdir -p /var/tmp/hostpath-provisioner
mkdir /tmp/hostpath-provisioner
sudo mount --bind /var/tmp/hostpath-provisioner /tmp/hostpath-provisioner

# sudo 돌리기
# https://www.lesstif.com/lpt/sudo-echo-permission-denied-89556053.html
echo '/var/tmp/hostpath-provisioner /tmp/hostpath-provisioner none defaults,bind 0 0' | sudo tee -a /etc/fstab
