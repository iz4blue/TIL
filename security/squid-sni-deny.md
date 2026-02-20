
```bash
$ sudo apt install squid-openssl
```

```bash
# mkdir -p /etc/squid/ssl
# cd /etc/squid/ssl
# openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
  -addext "basicConstraints=critical,CA:TRUE" \
  -addext "keyUsage=critical,keyCertSign,cRLSign" \
  -keyout pengtalk.key -out pengtalk.crt \
  -subj "/O=PengTalkCompany/CN=PengTalkProxyCA"
# chwon proxy:proxy ./*
```


```bash
# mkdir /var/spool/squid
# /usr/lib/squid/security_file_certgen -c -s /var/spool/squid/ssl_db -M 4MB
# chown -R proxy:proxy /var/spool/squid
```

```bash
# cat /etc/squid/squid.conf
cache_effective_user proxy
cache_effective_group proxy

# HTTPS 포트 설정 및 인증서 경로 지정
http_port 3128 ssl-bump \
  cert=/etc/squid/ssl/squid.crt \
  key=/etc/squid/ssl/squid.key \
  generate-host-certificates=on dynamic_cert_mem_cache_size=4MB

sslcrtd_program /usr/lib/squid/security_file_certgen -s /var/spool/squid/ssl_db -M 4MB
sslcrtd_children 5

# SSL Bump 규칙
acl target_domain dstdomain englishunt.dooray.com
acl block_mail_path urlpath_regex ^/mail/

ssl_bump peek all
ssl_bump bump target_domain
ssl_bump splice all

# 경로 차단 규칙
http_access deny target_domain block_mail_path
http_access allow target_domain
http_access allow all

```


```bash
# 설정 내용 정상인지 확인
$ sudo squid -k parse
$ sudo systemctl restart squid
$ sudo tail -f /var/log/squid/access.log
```

- Linux 컴퓨터에 CA 인증서 추가하기
```bash
sudo cp squid.crt /usr/local/share/ca-certificates/squid.crt
sudo update-ca-certificates
```

- fox 는 시스템 인증서를 따르지 않아 브라우져에 별도 설치가 필요함
  - 설정 > 개인 정보 및 보안 > 인증서 > 인증서 보기 열기
  - 인증 기관 에 “가져오기” 버튼 눌러 CA 인증서 추가
  - 팝업이 뜨는 것에 웹 페이지는 신뢰할 수 있도록 선택 = “신뢰 설정 편집” 과 동일한 작업
 

```bash
# nano /etc/squid/block_mail.html
# chmod 644 /etc/squid/block_mail.html

# cat /etc/squid/squid.conf

<... 생략 ...>
acl block_mail_path urlpath_regex /mail/

# 방금 만든 HTML 파일을 block_mail_path 규칙이 차단될 때 보여주라고 지정!
deny_info /etc/squid/block_mail.html block_mail_path

<... 생략 ...>

```

- curl 을 통한 테스트 방법
```bash
$ curl -v -x http://10.1.20.229:3128 \
    --cacert ./pengtalk.crt \
    https://englishunt.dooray.com/mail/
```
