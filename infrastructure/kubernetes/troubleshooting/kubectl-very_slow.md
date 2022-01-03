# 개요
 - kubectl 이 user 에 따라서 매우 느린 증상이 발생함
 - 증상이 느리긴 하였지만, 최종적인 결과는 나오는 상황이였음
 - 정상적일 때는 2초도 안걸리는 수행 시간이 비정상적일 때는 10초도 넘게 걸리는 상황임


# 문제의 원인 찾기

## kubectl 의 debug 레벨 올리기
 - kubectl 의 동작이 어떻게 다른지 정상적인 경우와 비정상적인 경우 모두 debug 레벨을 올려서 수행함

```bash
$ kubectl --v=9 get namespace
```

## 정상적인 경우와 비정상적인 경우의 로그 차이점 확인
 - 정상적인 경우는 명령이 한번에 수행되었으나, 비 정상적인 경우는 명령이 매우 여러번 재시도 하는 것을 확인하였음
 - 명령 수행에는 문제가 없어 보이나, 다음과 같은 에러가 발생한 뒤로 계속 같은 명령을 수행하는 것이 보였음

```text
I0103 05:27:16.373668   11773 cached_discovery.go:130] failed to write cache to /home/lge-robot/.kube/cache/discovery/4.46.0.51_443/servergroups.json due to mkdir 
/home/lge-robot/.kube/cache: permission denied
I0103 05:27:16.373921   11773 round_trippers.go:466] curl -v -XGET  -H "Accept: application/json, */*" -H "User-Agent: kubectl/v1.23.0 (linux/amd64) kubernetes/ab6
9524" 'https://4.46.0.51:443/apis/metrics.k8s.io/v1beta1?timeout=32s'
I0103 05:27:16.374021   11773 round_trippers.go:466] curl -v -XGET  -H "Accept: application/json, */*" -H "User-Agent: kubectl/v1.23.0 (linux/amd64) kubernetes/ab6
9524" 'https://4.46.0.51:443/apis/node.k8s.io/v1beta1?timeout=32s'
```

## 최종적으로 다음으로 해결함
 - 각자의 home 폴더에 .kube 폴더의 소유자가 root 로 되어 있는 것을 확인 함
 - 즉 kubectl 명령을 수행하는 과정에서 인증등의 정보 갱신을 .kube/cache 폴더에 갱신하려고 하였으나
 - root 권한으로 되어 있는 파일과 폴더에 파일 변경이 불가능하여 발생하는 문제였음
 - 자신의 계정에 맞는 권한으로 변경 후 정상 동작 함

```bash
$ sudo chown $USER:$USER -R ~/.kube
```

