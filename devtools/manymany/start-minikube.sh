#!/bin/bash

# https://krksap.tistory.com/1798
'''
Exiting due to GUEST_MISSING_CONNTRACK: Sorry, Kubernetes 1.33.1 requires conntrack to be installed in root's path
'''
sudo apt-get install -y conntrack

# crictl install 
- https://github.com/kubernetes-sigs/cri-tools?tab=readme-ov-file
'''
Exiting due to GUEST_MISSING_CONNTRACK: Sorry, Kubernetes 1.33.1 requires crictl to be installed in root's path
'''

# minikube cpu max
sudo minikube start --vm-driver=none


# https://minikube.sigs.k8s.io/docs/faq/#how-can-i-allocate-maximum-resources-to-minikube
# sudo minikube start --memory=max --cpus=max
