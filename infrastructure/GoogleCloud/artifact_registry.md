# 개요
 - Artifact Registry 에서 Google Cloud 의 Service Account 로 인증을 하기
 - gcloud auth 로도 가능하나 그것은 개인 계정을 공유해야 할 수 있으므로 이 방법도 추천(?)
 - 근데 생각해보니 gcloud auth 로 인증을 해두는 것이 다시 복호화를 못하므로 더 안전한 것이 아닌가???
 - https://cloud.google.com/artifact-registry/docs/docker/authentication?hl=ko#json-key

```bash
$ 
$ cat KEY-FILE | docker login -u KEY-TYPE --password-stdin \
   https://LOCATION-docker.pkg.dev
```

 - KEY-FILE 은 Service Account 파일
 - KEY-TYPE 은 _json_key : json파일 자체 , _json_key_base64 : base64 로 인코딩한 파일
 - LOCATION 은 asia-northeast3-docker.pkg.dev 와 같은 주소 (여기서는 asia-northeast3 를 가르킴)

# 만약 gcloud 자체가 없다면
 - 아래의 내용을 다음의 base64 인코딩한 내용으로 채우면 됨

```bash
$ cat KEY-FILE | base64
$ mkdir ~/.docker
$ cat config.json
{
        "auths": {
                "asia-northeast3-docker.pkg.dev": {
                        "auth": ""
                }
         }
}
```
