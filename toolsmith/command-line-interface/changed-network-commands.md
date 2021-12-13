# 개요
 - 배포판들이 판올림 되면서 기존의 구식 커멘드 들이 계속 사라지고 있다.
 - 변경되는 명령어의 사용법들을 기록하자


# 명령어

## nslookup
 - nslookup 명령이 없는 곳이 점점 생겨난다.
 - dig 명령어 혹은 getent 명령어를 사용하자.

```bash
$ getent hosts google.com
$ getent ahosts google.com

$ dig google.com
```

