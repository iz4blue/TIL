# 개요
 - ubuntu 20.04 부터인지 예전버젼인지 부터 /etc/resolv.conf 파일을 수정하면 다시 원복이 된다.
 - 알고보니 netplan 으로 설정한 네트워크 구성으로 다시 롤백이 되는 증상이였음
 - /etc/resolv.conf 의 파일을 보면 관련된 내용이 잘 설명되어 있음

# 처치

## netplan 에 대한 간단한 설명 및 설정
 - /etc/netplan 폴더 밑에 인터페이스별로 설정파일이 존재하여 yaml 형태로 정의하게 되어 있음
 - https://netplan.io/examples/

## netplan 명령어

```bash
# 설정된 DNS Server 정보 확인하기
$ sudo systemd-resolve --status

# 설정된 네트워크 정보 보기
$ netplan get

# 설정 변경후 적용하기
$ netplan apply

```
