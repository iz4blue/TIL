# 설명
 - 멀티캐스트 패킷을 확인할 수 있는 방법을 마련한다.

# 방법

## iperf2 설치
 - https://iperf.fr/iperf-download.php#ubuntu
 - iperf3 가 최신이나 iperf2 만 가능하다고 함 : 아직 명확하게 확인은 하지 못함

```bash
sudo wget -O /usr/bin/iperf https://iperf.fr/download/ubuntu/iperf_2.0.9
sudo chmod +x /usr/bin/iperf
```

## multicast 테스트
 - 서버와 클라이언트가 필요함

```bash
# server
$ iperf -c 224.0.1.1 -u -T 32 -t 10 -i 1 -p 54321
```

```bash
# client
$ iperf -s -u -B 224.0.1.1 -i 1 -p 54321
```
