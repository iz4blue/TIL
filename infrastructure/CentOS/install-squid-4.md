# 개요
 - CentOS 에서 squid proxy 설치를 진행한다.
 - 참조 : https://wiki.squid-cache.org/KnowledgeBase/CentOS#Squid_on_CentOS

## 명령
 - repository 추가
 - yum update (필요한 repos 만 확인)
 - yum install

```bash
$ sudo tee /etc/yum.repos.d/squid-proxy-4.repo > /dev/null << EOF
[squid]
name=Squid repo for CentOS Linux - 7 
#IL mirror
baseurl=http://www1.ngtech.co.il/repo/centos/$releasever/beta/$basearch/
failovermethod=priority
enabled=1
gpgcheck=0
EOF

$ yum update
$ yum install squid
```
