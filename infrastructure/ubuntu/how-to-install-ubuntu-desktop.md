# 개요
 - ubuntu 시스템을 cloud 에 올려두고 rdp 로 접속하여 고성능 작업을 remote 에서 한다.

# 방법

## ubuntu 설치
 - ubuntu-desktop , xrdp 등을 설치하여 사용한다.
 - ubuntu 계정의 암호로 로그인 한다고 가정
 - ssh login 으로 사용할 것은 아니지만 rdp 의 접속으로는 설정한 암호를 사용할 수 있음


```bash
$ sudo apt update
$ sudo apt install ubuntu-desktop xrdp

# ubuntu 계정의 암호 변경
$ sudo passwd ubuntu

$ sudo systemctl enable xrdp
```

## 만약에 인증관련 문제로 접속이 안된다면

```bash
 # cat > /etc/polkit-1/localauthority/50-local.d/10-allow-colord.pkla
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
```
