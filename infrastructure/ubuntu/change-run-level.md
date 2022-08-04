# 개요
 - Desktop 으로 설치된 ubuntu 가 있는데 GUI 를 띄우기 싫다면?
 - runlevel 을 변경해야 함

## 방법
 - 지금의 runlevel 설정을 확인하고
 - 원하는 runlevel 로 변경하자

### 참고
 - 0 : poweroff.target 
 - 1 : rescue.target 
 - 2, 3, 4 : multi-user.target 
 - 5 :  graphical.target
 - 6 :  reboot.target


```bash
$ sudo systemctl get-default 
$ sudo systemctl set-default multi-user.target 
```
