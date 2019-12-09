# Docker 설치
- https://docs.docker.com/install/linux/docker-ce/ubuntu/

```
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
$ sudo usermod -aG docker $USER
```

# mysql-server 설치
- 관리 편의상 지금까지 호환성이 좋은 5.7 을 설치
- 초기 암호는 없으나 linux root 계정으로만 접속 가능함
- https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04

```
$ sudo apt-get install mysql-server-5.7
$ sudo mysql
mysql> CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
mysql> quit

# bind-address 127.0.0.1 -> 0.0.0.0 으로 수정
$ sudo systemctl restart mysql
```

# xe-core build
- php 7.0.33 이 7.0 의 마지막 패치 버전
- https://www.php.net/releases/index.php
- https://hub.docker.com/_/php

```
$ sudo docker build -t xe-core:1.11.6 .
```

# mysql restore

```
$ zcat cham_sori.sql.gz | sudo mysql cham_sori-1912
```

# XE 설치
- 백업된 압축 풀기
- public_html 707 으로 권한 변경하기
- files 권한 변경하기
- db.config.php 파일 수정하기
  - 172.17.0.1 으로 ip 변경
  - db_userid , db_password , db_database 확인
  - default_url 확인

```
$ sudo chmod 707 public_html
$ sudo chown www-data:www-data ./files

```

# docker 실행하기

```
$ docker run -d -p 8080:80 --name xe -v /home/iz4blue/docker/cham-sori/public_html:/var/www/html xe-core:1.11.6
```

# apache reverse proxy 설정하기
- 도메인으로 접속할 수 있도록 하기
- 각각의 도커가 자유롭게 실행될 수 있도록 하기 위한 장치
- https://www.digitalocean.com/community/tutorials/how-to-use-apache-http-server-as-reverse-proxy-using-mod_proxy-extension
- https://judo0179.tistory.com/34


```
$ sudo apt-get install apache2
$ sudo a2enmod proxy proxy_http ssl
$ sudo systemctl restart apache2
```

# HTTP_X_FORWARDED_FOR 처리
- https://xe1.xpressengine.com/tip/22174018
- https://xe1.xpressengine.com/qna/22910501
- 



# Let's Encrypt 설치하기
- https://blog.lael.be/post/5107
- https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04


# Dockerfile 에 log 관리
- logrotate 설치
- 관련 로그 내용 외부로 export 하기
- 



# 메일발송 셋팅
- http://study4you.kr/xe/homepage/47647



# 참고 url
- https://rampart81.github.io/post/dockerfile_instructions/
- https://www.leaseweb.com/labs/2014/12/tutorial-apache-2-4-transparent-reverse-proxy/
- https://stackoverflow.com/questions/760283/apache-proxypass-how-to-preserve-original-ip-address
- 
