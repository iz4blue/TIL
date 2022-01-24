# 설명
 - 멀티캐스트 패킷을 확인할 수 있는 방법을 마련한다.

# 방법

## iperf2 설치
 - https://iperf.fr/iperf-download.php#ubuntu
 - iperf3 가 최신이나 iperf2 만 가능하다고 함 : 아직 명확하게 확인은 하지 못함

```bash
sudo curl -o /usr/bin/iperf https://iperf.fr/download/ubuntu/iperf_2.0.9
sudo chmod +x /usr/bin/iperf
```

## multicast 테스트
 - 서버와 클라이언트가 필요함

```bash
# server
$ iperf -s -u -B 224.0.1.1 -i 1 -p 54321
```

```bash
# client
$ iperf -c 224.0.1.1 -u -T 32 -t 10 -i 1 -p 54321
```

## multicast 테스트 with interface
 - 서버와 클라이언트의 인터페이스 지정 방법이 다름
 - 서버의 경우는 인터페이스만 지정하면 됨 : net1
 - 클라이언트는 반드시 ip 주소가 있어야 하고, ip 주소를 기준으로 인터페이스를 찾아서 지정함 : 172.16.10.12
```
# server
$ iperf -s -u -B 224.0.1.1%net1 -i 1 -p 54321

# client
$ iperf --bind 172.16.10.12 -c 224.0.1.1 -u -T 32 -t 10 -i 1 -p 54321
```

# 참고

## 클라우드사 멀티캐스트 동작
 - AWS EC2 안됨
 - GCP VirtualMachine 안됨

## 가상머신
 - VirtualBox 됨
 - Docker 됨 : 상황에 따라서 다를 수 있으나 eth0@if434 등으로 잡히는 형태는 되었음
 - K8S : 같은 Node , 다른 Pod : eth0@if438 과 같은 형태 : 안됨
 - GKE : 같은 Node , 다른 Pod : 안됨

