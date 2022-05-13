# 개요
 - barematel 장비를 사용하다보니 모든 CPU 갯수 만큼 비용이 청구되어 실제 사용하는 것 이상 과금이 될 수 있음
 - 예를 들어 우리는 16개 정도의 CPU 만 사용하면 되는데, 하드웨어상 128개의 cpu 가 잡히는 경우 128개가 과금이 됨
 - 추가로 limit-cpus 를 systemd 의 서비스로 만들고 싶으나, 검증 시간이 오래걸려 일단 가장 쉬운 방법으로 해결 함

# 해결 방법

## 하드웨어의 동작 cpu 를 제한
 - hyperthreading 을 disable 하여 물리적 cpu 를 최대한 사용하도록 함
 - bios 등을 통해 cpu 를 제한하는 방법도 있음
 - 하지만 여기서는 cpu를 사용하지 않도록 proc 파일 시스템으로 명령을 함

## smt off (=hyperthreading off)
```bash
# echo off > /sys/devices/system/cpu/smt/control
```

## cpu off
```bash
# echo 0 > /sys/devices/system/cpu/cpu28/online
```

## anthos 의 cpu 갯수 파악에 반영해야 하는 경우
 - docker 데몬과 함께 anthos 에서 파악하는 시스템 정보의 pods 이 동작하면 명령이 반영되는 타이밍에 따라서 cpu 갯수가 달라질 수 있다.
 - 그래서 docker 의 시작을 별도의 순서로 기동할 수 있게 변경한다.
 - rc.local 을 이용하여 별도 시작 스크립트를 만든다.

```bash

$ systemctl stop docker.socket
$ systemctl disable docker.socket
$ systemctl stop docker.service
$ systemctl disable docker.service

$ sudo -i

# cat << EOF > /etc/rc.local
#!/bin/bash

echo off > /sys/devices/system/cpu/smt/control

echo 0 > /sys/devices/system/cpu/cpu28/online
echo 0 > /sys/devices/system/cpu/cpu29/online
echo 0 > /sys/devices/system/cpu/cpu30/online
echo 0 > /sys/devices/system/cpu/cpu31/online
echo 0 > /sys/devices/system/cpu/cpu32/online

systemctl start docker.service
systemctl start docker.socket

EOF

# chmod +x /etc/rc.local
# systemctl start rc-local.service
# systemctl enable rc-local.service

# cpu 갯수 확인
# lscpu
```

# 최종 확인
## CLI 를 통한 CPU 사용 갯수 변경 확인
```bash
$ kubectl get nodes -o=jsonpath="{range .items[*]}{.metadata.name}{\"\t\"} \
  > {.status.capacity.cpu}{\"\n\"}{end}"

```

## 비용 그래프를 통한 절감 확인
![anthos price down.png](/.attachments/anthos%20price%20down-9b20c3d3-cc38-4dd4-8127-983787820f86.png)


# 참고 URL
 - https://askubuntu.com/questions/942728/disable-hyper-threading-in-ubuntu
 - https://flylib.com/books/en/1.549.1.28/1/
 - https://serverfault.com/questions/235825/disable-hyperthreading-from-within-linux-no-access-to-bios
 - https://serverfault.com/questions/235825/disable-hyperthreading-from-within-linux-no-access-to-bios
 - https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt
