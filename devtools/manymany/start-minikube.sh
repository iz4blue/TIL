#!/bin/bash

# https://krksap.tistory.com/1798

sudo apt-get install -y conntrack

# minikube cpu max
sudo minikube start --vm-driver=none --memory=max --cpus=max
