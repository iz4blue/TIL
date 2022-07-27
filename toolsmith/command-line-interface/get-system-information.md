# 개요
 - 시스템 부팅 없이 하드웨어 정보 혹은 시스템 일련 번호들을 알고 싶을 때

## 방법
 - dmidecode 를 이용해서 시스템 정보를 읽어 온다.
 - hardware 정보를 찾으면 hp 의 경우는 시스템 모델명과 하드웨어 일련번호도 읽힌다.

```bash
# dmidecode -q > dmidecode.txt

```
