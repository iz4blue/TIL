# 개요
- OPNsense 내장 IPS(Suricata) 를 이용하여 특정 domain 을 차단하는 방법

## 설정
- Services > Intrusion Detection > Administration 으로 이동
- Settings 탭에서 아래의 내용들 켜기
  - Enabled: 체크 (엔진 켜기)
  - IPS mode: 체크 (단순 탐지가 아닌 적극적 차단 활성화)
  - Promiscuous mode: 체크 (전체 패킷 감시)
  - Interfaces: 내부망(Windows Host들이 있는 LAN)을 선택
- Apply 로 적용

## 상세 rule 설정
- SSH로 접속 하여 Shell 선택 (8번)
- 아래의 커스텀 rule 생성
```bash
$ cat > /usr/local/etc/suricata/rules/custom.rules << EOF
drop tls any any -> any any (msg:"Block Englishunt Domain"; tls.sni; content:"englishunt.dooray.com"; sid:1000001; rev:1;)
EOF
```
- Services > Intrusion Detection > Administration 의 Rules 탭 에서 추가한 내용이 잘 반영되어 있는지 확인 후 Apply



