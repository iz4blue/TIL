# 개요
 - cert-manager 를 통해서 인증서를 자동 갱신 하고 싶었으나,
 - nginx 의 ingress 가 http 요청을 무조건 https 로 redirect 하는 관계로
 - 임시로 Let's Encrypt 의 사이트에서 수동으로 인증서를 발급 받아 k8s 에 넣는 과정을 설명

# 방법

## Let's Encrypt 인증서 발급
 - 인증서 발급 클라이언트인 certbot 설치
 - 일반 계정으로 진행시 특정 폴더에 기록될 파일들을 위해 폴더 권한을 높임
 - certbot 을 통해 도메인으로 인증서 발급 진행
 - certbot 에게 메뉴얼로 토큰을 발행 받음
 - (어플리케이션에서 DNS 설정으로 TXT 레코드를 추가하라고 안내를 함)
 - dns 서비스에 제시 받은 TXT 레코드를 추가 함
 - 계속 진행을 하면 Let's Encrypt 에서 제시한 도메인 정보가 갱신이 되었는지 확인하고 인증서를 발급해줌

```bash
$ sudo apt install certbot

$ sudo chmod 777 /var/log/letsencrypt
$ sudo chmod 777 /etc/letsencrypt/
$ sudo mkdir /var/lib/letsencrypt
$ sudo chmod 777 /var/lib/letsencrypt

$ certbot certonly \
    --manual \
    --preferred-challenges=dns \
    --email [인증서 만료전 안내받을 이메일주소] \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos \
    --debug \
    --no-bootstrap \
    -d [도메인주소]
```

## k8s 에서 사용하기 위해 TLS 를 등록
 - 발급받은 TLS 를 secret 에 등록함

```bash
$ kubectl create secret tls [nginx ingress에서 사용할 TLS이름] \
    --key /etc/letsencrypt/live/[앞서 지정한 도메인주소]/privkey.pem \
    --cert /etc/letsencrypt/live/[앞서 지정한 도메인주소]/fullchain.pem \
    -n default
```

## nginx ingress 에 TLS 설정을 추가함
 - https://kubernetes.io/ko/docs/concepts/services-networking/ingress/#tls

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: tls-example-ingress
spec:
  tls:
  - hosts:
      - https-example.foo.com
    secretName: [nginx ingress에서 사용할 TLS이름]
  rules:
  - host: https-example.foo.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: service1
            port:
              number: 80
```

## 갱신
 - 이렇게 처음부터 메뉴얼로 진행을 하게 되면 추후에도 메뉴얼로 하게 된다.
 - 그리고 DNS 의 경우도 항상 새로운 텍스트를 요구 받기 때문에 수동으로 할 수 밖에 없다.
 - https://community.letsencrypt.org/t/will-renewal-always-require-new-dns-acme-challenge-txt/102820
 - 마치고 나면 새롭게 바뀌어 있는 인증서의 내용을 configmap 에 다시 넣어주자

```bash
$ certbot certonly \
    --manual \
    --preferred-challenges=dns \
    -d [도메인주소]
    
```
## 갱신 적용
 - 갱신을 적용하는 것은 별다른 명령이 존재하지 않음
 - yaml 로 파일을 생성한 뒤 같은 내용이 update 되는 것이 가장 정확해 보임

```bash
$ kubectl create secret tls [nginx ingress에서 사용할 TLS이름] \
    --key /etc/letsencrypt/live/[앞서 지정한 도메인주소]/privkey.pem \
    --cert /etc/letsencrypt/live/[앞서 지정한 도메인주소]/fullchain.pem \
    -n default --dry-run=client -o yaml | kubectl apply -f -
```


## 참고로그

### 인증서 갱신

```text
root@ip-172-31-26-237:/etc/letsencrypt# certbot certonly --manual --preferred-challenges=dns -d [도메인주소]
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer None
Cert is due for renewal, auto-renewing...
Renewing an existing certificate
Performing the following challenges:
dns-01 challenge for [도메인주소]

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTE: The IP of this machine will be publicly logged as having requested this
certificate. If you're running certbot in manual mode on a machine that is not
your server, please ensure you're okay with that.

Are you OK with your IP being logged?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: y

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please deploy a DNS TXT record under the name
_acme-challenge.[도메인주소] with the following value:

Xcl9yR2YFgTovY4oHyca1gwoCv7ZkgTOmRzcFgZGgvo

Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/[도메인주소]/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/[도메인주소]/privkey.pem
   Your cert will expire on 2022-09-12. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

root@ip-172-31-26-237:/etc/letsencrypt#
```
