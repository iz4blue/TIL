# 개요
 - GPU 를 사용하는 pod 를 찾아보자

```bash
$ kubectl get pods -o json -A | jq -r '.items[] | select(.metadata.name | test("request-")).metadata.name'
$ kubectl get pod -o json -A | jq -r '.items[] | select(.spec.containers[].resources.requests | has("nvidia.com/gpu")).metadata.name'
```
