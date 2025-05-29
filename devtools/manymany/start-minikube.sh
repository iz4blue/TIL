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

# aaa
```
Exiting due to NOT_FOUND_CRI_DOCKERD
```
- https://github.com/Mirantis/cri-dockerd/issues/361#issuecomment-2387142829

# bbbb
```
Exiting due to HOST_JUJU_LOCK_PERMISSION: Failed to start host: boot lock: unable to open /tmp/juju-mkc8ab01ad3ea83211c505c81a7ee49a8e3ecb89: permission denied
```

sudo sysctl fs.protected_regular=0


# cccc
```
Exiting due to NOT_FOUND_CNI_PLUGINS
```
- https://minikube.sigs.k8s.io/docs/faq/#how-do-i-install-containernetworking-plugins-for-none-driver



# minikube cpu max
sudo minikube start --vm-driver=none


# https://minikube.sigs.k8s.io/docs/faq/#how-can-i-allocate-maximum-resources-to-minikube
# sudo minikube start --memory=max --cpus=max
