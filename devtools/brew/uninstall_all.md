# 개요
 - brew 으로 인스톨한 모든 앱(?) 패키지(?)를 삭제한다.


```bash
# 설치한 모든 앱 삭제
$ brew remove --force $(brew list --formula)

# 설치한 모든 외부 패키지 삭제
$ brew remove --cask --force $(brew list)
```
