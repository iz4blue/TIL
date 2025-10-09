# 개요
- reverse proxy 구성을 할 때 바로 안되는 문제를 해결 하기 위한 내용
- 구성 후 접속 했을 때 "400 Bad Request" 의 에러 메시지가 나타나면 해야할 작업

# 기술적 내용
- home-assistant 의 경우 reverse proxy 를 통해서 접속하게 되면 어떤 이유에서인지 접속을 차단하게 되어 있음
- 이유는 모르겠지만 proxy 연결을 일단 막는 듯 한 느낌이 좀 있음
- reverse proxy 에서 web socket 을 지원하도록 해야 함
- 공식 설명 : https://www.home-assistant.io/integrations/http/#reverse-proxies

# 설정방법
- home assistant 폴더에 들어가서 configuration.yaml 파일을 수정해야 함
- 위치는 맨 마지막 최상단 항목으로 작성하면 됨

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 10.0.0.200      # Add the IP address of the proxy server
    - 172.30.33.0/24  # You may also provide the subnet mask
```
