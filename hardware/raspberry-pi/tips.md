# 이미지 생성 이후

## wifi network 자동 접속
 - https://www.raspberrypi.com/documentation/computers/configuration.html#configuring-networking31

```bash
$ cd boot
$ cat > wpa_supplicant.conf << EOF
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
country=KR
update_config=1

network={
 ssid="<Name of your wireless LAN>"
 psk="<Password for your wireless LAN>"
}

EOF

```

## ssh 사용 설정
 - https://www.raspberrypi.com/documentation/computers/remote-access.html#enabling-the-server
 
```bash
$ cd boot
$ touch ssh

```

