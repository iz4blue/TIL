#!/bin/bash

# https://krksap.tistory.com/1798

sudo apt-get install -y conntrack

# minikube cpu max
sudo minikube start --vm-driver=none


# https://minikube.sigs.k8s.io/docs/faq/#how-can-i-allocate-maximum-resources-to-minikube
# sudo minikube start --memory=max --cpus=max
