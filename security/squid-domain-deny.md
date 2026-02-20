
```bash
# cat /etc/squid/squid.conf
cache_effective_user proxy
cache_effective_group proxy

# HTTPS 포트 설정 및 인증서 경로 지정
http_port 3128

acl target_domain dstdomain englishunt.dooray.com

acl CONNECT method CONNECT

http_access deny target_domain
http_access allow all
```

차단 안내 페이지는 띄우기 불가능 하려면 SSL Bump 설정이 필요함
