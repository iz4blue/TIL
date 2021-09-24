# 개요
 - azure devops 의 self-hosted agent 설치를 하는데 필요한 과정을 정리
 - proxy 는 squid proxy 를 사용함
 - https://docs.microsoft.com/ko-kr/azure/devops/pipelines/agents/v2-linux?view=azure-devops
 - https://docs.microsoft.com/ko-kr/azure/devops/pipelines/agents/proxy?view=azure-devops&tabs=unix

## 과정
 - squid proxy 설치 : 생략
 - squid proxy 설정
 - azure devops self-hosted agent 설치
 - agent 설정

### squid proxy 설정
 - 내부 네트워크는 10.2.0.0/16 으로 설정

```bash
$ sudo tee /etc/squid/squid.conf > /dev/null << EOF
acl localnet src 10.2.0.0/16

acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 443

acl CONNECT method CONNECT

http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports

http_access allow localhost manager
http_access deny manager

http_port 80

acl white_urls dstdomain "/etc/squid/whitelisted_sites.acl"
http_access allow white_urls

http_access deny all
EOF

$ sudo tee /etc/squid/whitelisted_sites.acl > /dev/null << EOF
dev.azure.com
login.microsoftonline.com
management.core.windows.net
vstsagentpackage.azureedge.net
vssps.dev.azure.com
EOF
```

### azure devops self-hosted agent 설치
 - org 는 https://dev.azure.com/POC-Cloudmt/ 임
 - PAT 는 사전에 사전에 설정해두어야 함 : 참고 url 에 매우 상세히 나와 있음
 - proxy 서버는 10.2.0.4 이고 80 으로 구성됨
 - 주의할 점이 10.2.0.4:80 으로 port 를 꼭 붙여주어야 함

```bash
$ curl -O https://vstsagentpackage.azureedge.net/agent/2.192.0/vsts-agent-linux-x64-2.192.0.tar.gz
$ mkdir azure_agent
$ cd azure_agent
$ tar xzvf ../vsts-agent-linux-x64-2.192.0.tar.gz
$ ./config.sh --proxyurl http://10.2.0.4:80

# 사용약관에 동의 하느냐? : Y
# 접속 주소는 어떻게 되느냐? : https://dev.azure.com/POC-Cloudmt
# 인증 방식은? : PAT
# 토큰은? : ****************************************************

$ ./run.sh
```


