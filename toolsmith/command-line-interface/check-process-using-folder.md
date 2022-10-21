# 개요
 - unmount 하고 싶은데 'target is busy' 라고 나오면서 폴더 unmount 못하는 경우

## 방법
 - fuser -cu [마운트 경로] 로 어떤 프로세스가 사용하는지 확인
 - fuser -ck [마운트 경로] 로 사용하는 프로세스 강제 종료

