# 개요
 - apt 업데이트시 proxy를 사용할 수 있도록 설정을 한다.
 - 대부분 console 에서 직접 설정을 하는 경우는 export http_proxy 등으로 사용할 수 있지만
 - sudo 와 같은 것이나 외부 쉘을 이용하는 경우는 적용이 되지 않는 경우가 있어 proxy 설정을 할 필요가 있는 경우가 있다.

# 설정
 - /etc/apt/apt.conf.d 에 파일로 설정을 추가하면 됨
 - `Acquire::http::Proxy "http://user:password@proxy.server:port/";` 와 같은 설정을 추가 하면 됨
 - Acquire 구문을 묶어서 사용할 수 있음
 - socks5h 의 경우는 DNS 요청까지 proxy로 전달하여 처리함

```bash
# cat <<EOF >> /etc/apt/apt.conf.d/80proxy.conf
Acquire {
  HTTP::proxy "http://127.0.0.1:8080";
  HTTPS::proxy "http://127.0.0.1:8080";
}
EOF

```
