# 개요
 - headless 로 설정하는 것이 가장편한 zero 의 경우 wifi 설정이 거의 필수적임
 - 하지만 rasberry pi imager 로 wifi 설정을 하게 되면 wifi 가 잡히지 않음

# 해결
 - 여러 내용을 찾고 시행착오 결과 다음과 같은 결론을 내림
 - zero 의 경우 ( zero 2w 로 확인 ) wifi 국가 변경에 대한 기능이 잘 동작하지 않는듯
 - 최소한 KR 이 없어서 wifi 동작이 안되니 US 로 설정하여 wifi 를 설정해야 함

```
$ sudo cat /etc/wpa_supplicant/wpa_supplicant.conf
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
	ssid="[[SSID]]"
	psk="[[PASSWORD]]"
  key_mgmt=WPA-PSK
}
```
