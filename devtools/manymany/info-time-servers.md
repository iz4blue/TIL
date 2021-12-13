# 개요
 - 각종 클라우드 시스템에서 사용하는 타임 서버의 정보 나열
 - 또는 공개되어 있는 NTP 서버들을 기록하여 매번 찾는 것을 줄여보자


# 정보

## AWS
 - 0.amazon.pool.ntp.org , 1.amazon.pool.ntp.org , 2.amazon.pool.ntp.org , 3.amazon.pool.ntp.org
 - VM 을 생성하면 자동으로 위 주소들이 설정되어 있어 별로 신경 쓰지 않아도 됨


## GCP
 - 168.254.168.254 의 IP 로 내부 time server 가 싱크를 맞추고 있음


## Google 공개 NTP
 - https://developers.google.com/time
 - time.google.com 이 주 서버이며 다음의 주소를 설정하게 되어 있음
 - time1.google.com , time2.google.com , time3.google.com , time4.google.com


## 한국 NTP 서버
 - https://www.pool.ntp.org/zone/kr
 - kr.pool.ntp.org 이 주 서버이며 다음의 주소를 설정하게 되어 있음
 - 2.kr.pool.ntp.org , 2.asia.pool.ntp.org , 0.asia.pool.ntp.org

