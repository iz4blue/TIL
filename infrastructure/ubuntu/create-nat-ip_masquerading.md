# 개요
 - 외부와 통신할 NAT 설정을 진행한다.

## 사전 필요조건
 - 공인 IP 를 미리 할당 받는다.
 - 어떤 사설 인터페이스를 사용할 것인지 미리 정해둔다.
   - 사설 IP 대역은 어떻게 활용할 것인지 결정한다. ex) 192.168.0.0/16

## 참고사항
 - 공인 인터페이스는 ens160
 - 사설 IP 대역은 192.168.11.0/24 로 결정함
 - 사설 인터페이스는 ens192
 - NAT 의 경우는 192.168.0.0/16 대역을 모두 처리하는 것으로 설정함
 - 필요시 사설대역의 라우팅은 추후 다시 추가하는 것으로 하겠음

## 설치과정

### 사설 인터페이스 IP 설정
 - 참고 url : Static IP Address Assignment 참조 https://ubuntu.com/server/docs/network-configuration 
```
# cat << EOF > /etc/netplan/01-private-config.yaml
network:
  ethernets:
    ens192:
      addresses:
      - 192.168.11.1/24
  version: 2
EOF
```

### iptables 를 이용한 Masquerading
 - 참고 url : https://ubuntu.com/server/docs/security-firewall
 - 참고 url : https://wp.secretnest.info/archives/12170
```
# /etc/sysctl.conf 파일 수정
net.ipv4.ip_forward=1

# cat << EOF > /etc/rc.local 
#!/bin/bash
iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -o ens160 -j MASQUERADE
exit 0
EOF

# chmod +x /etc/rc.local

# cat << EOF > /etc/systemd/system/rc-local.service
[Unit]
Description=/etc/rc.local Support
ConditionPathExists=/etc/rc.local

[Service]
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF

# systemctl enable rc-local
```

### reboot 이후 적용 여부 확인
 - 반드시 설정한 뒤에는 reboot 으로 관련 내용이 재시작 이후에도 반영되는지 확인 필요
```bash
$ sudo reboot
```

