# 개요
 - raspberry pi 설정을 하여 사용하다 보면 wifi 접속이 잘 안될때가 많다.
 - 확인해보면 raspberry pi 의 경우 wifi 가 절전 모드로 되는 경우 때문에 사용하지 않고 있으면 접속이 끊어지는 듯 싶다.
 - https://tosbourn.com/stop-wireless-turning-off-raspberry-pi/

## 명령
```bash
# 8192 칩의 한정적이지만 가장 많이 쓰니... 1이나 2가 나오면 절전 모드를 사용중
# cat /sys/module/8192cu/parameters/rtw_power_mgnt

# 임시로 power save mode off
# iw wlan0 set power_save off

# 아예 설정으로 입력
# cat /etc/wpa_supplicant/wpa_supplicant.conf
wireless-power off
```
