# 개요
 - artifact registry 에 접근 가능한 ServiceAccount 를 이용하여
 - Kubernetes 접근 ImagePull Secret 등록하기
 
```bash
$ kubectl create secret docker-registry registry-secret \
  --docker-server=LOCATION-docker.pkg.dev \
  --docker-username=_json_key \
  --docker-email=ACCOUNT_NAME@PROJECT_NAME.iam.gserviceaccount.com \
  --docker-password="$(cat registry-access-key.json)"
```
