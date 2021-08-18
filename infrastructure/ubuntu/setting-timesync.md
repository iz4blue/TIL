# 내용
 - ubuntu 20.04 에서 ntp 설정을 하는 방법
 - 최대한 추가 프로그램 없이 ntp 설정으 하는 방법
 - https://ubuntu.com/server/docs/network-ntp

## 기존에 설정된 내용 확인
 - 아래에서 NTP service 가 active 이면 ntp 설정이 동작하고 있는 것
 - 서버으 주소는 로그 파일로 파악해야 함 아래의 로그에서느 192.168.0.241 이 설정된 주소임
```bash
$ timedatectl
               Local time: 수 2021-08-18 20:14:17 KST
           Universal time: 수 2021-08-18 11:14:17 UTC
                 RTC time: 수 2021-08-18 11:14:17
                Time zone: Asia/Seoul (KST, +0900)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
$ systemctl status systemd-timesyncd
● systemd-timesyncd.service - Network Time Synchronization
     Loaded: loaded (/lib/systemd/system/systemd-timesyncd.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2021-08-18 20:10:42 KST; 4min 56s ago
       Docs: man:systemd-timesyncd.service(8)
   Main PID: 1400655 (systemd-timesyn)
     Status: "Initial synchronization to time server 192.168.0.241:123 (192.168.0.241)."
      Tasks: 2 (limit: 4651)
     Memory: 1.2M
     CGroup: /system.slice/systemd-timesyncd.service
             └─1400655 /lib/systemd/systemd-timesyncd

 8월 18 20:10:42 nat-vm2 systemd[1]: Starting Network Time Synchronization...
 8월 18 20:10:42 nat-vm2 systemd[1]: Started Network Time Synchronization.
 8월 18 20:10:42 nat-vm2 systemd-timesyncd[1400655]: Initial synchronization to time server 192.168.0.241:123 (192.168.0.241).
```

## ntp 서버 변경
 - /etc/systemd/timesyncd.conf 파일을 수정한다.
 - sudo systemctl restart systemd-timesyncd
```bash
# cat > /etc/systemd/timesyncd.conf << EOF
[Time]
NTP=192.168.0.241
FallbackNTP=kr.pool.ntp.org
EOF

# sudo systemctl restart systemd-timesyncd
# systemctl status systemd-timesyncd
```

