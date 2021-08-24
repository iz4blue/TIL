# 내용
 - 네트워크에 접속한다.
 - 접속을 하며 기본적으로 ping 에 대해서는 반응을 해준다.
 - https://docs.micropython.org/en/latest/esp32/quickref.html#networking

## code
```python
import network
wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.scan()
wlan.connect('SSID', 'PASSWORD')
wlan.isconnected()
wlan.ifconfig()

```
