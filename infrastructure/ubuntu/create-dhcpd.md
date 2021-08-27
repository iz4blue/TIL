# 개요
 - dhcpd 를 설정하여 ubuntu 에서 dhcpd 를 운영하자
 - [ToDO] authoritative 옵션은 어떤 것인지 추가로 알고 싶다.

## 설정
 - dhcp 대상은 enp0s8
 - isc-dhcp-server 설치
 - /etc/dhcp/dhcpd.conf 설정
 - /etc/default/isc-dhcp-server 설정

```bash
# sudo apt install isc-dhcp-server
# cat << EOF > /etc/dhcp/dhcpd.conf
#authoritative;

subnet 192.168.11.0 netmask 255.255.255.0
  range 192.168.11.11 192.168.11.30
  option broadcast-address 192.168.11.255;
  option routers 192.168.11.1;
  default-lease-time 600;
  max-lease-time 7200;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  option domain-name "private";
}

# cat << EOF > /etc/default/isc-dhcp-server
INTERFACES="enp0s8"
EOF
