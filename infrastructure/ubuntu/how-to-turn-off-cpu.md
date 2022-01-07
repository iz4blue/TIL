# 개요
 - 경우에 따라서 라이센스 문제로 하드웨어의 CPU 갯수를 줄여야 할 경우가 있다.
 - 이 때 사용할 수 있는 sysfs 를 통해서 조작이 가능한 명령을 파악한다.

# 방법

## hyper-threading 끄기

```bash
$ sudo echo off > /sys/devices/system/cpu/smt/control
```

## cpu 끄기

```bash
$ sudo echo 0 > /sys/devices/system/cpu/cpu28/online
```
