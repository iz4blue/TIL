# 개요
 - journalctl 로 로그를 정상적으로 비워내고 싶다.
 - 근데 모든 로그를 비워낼 수는 없고 특정  unit 만 상황에 맞게 지우고 싶다.

## 명령
 - 최근 항목이 비활성 파일로 이동되도록 작업: 이 작업을 해야 완벽하게 파일이 제거됨
 - 최근에 2일 까지만 로그를 유지
 - multipath unit 만 30분까지 유지 : 30분 이전의 내용은 모두 삭제
 - 전체 용량을 500M 만 남기고 삭제
```bash
$ sudo journalctl --rotate
$ sudo journalctl --vacuum-time=2d
$ sudo journalctl --vacuum-time=30min
$ sudo journalctl -u multipath --vacuum-time=30min
$ sudo journalctl --vacuum-size=500M
```
