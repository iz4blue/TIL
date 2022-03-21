# 개요
 - node 가 실행될 기본 환경을 구성한다.


# 명령

## node 설치
 - https://github.com/nodesource/distributions/blob/master/README.md
```bash
# Using Ubuntu
$ curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
$ sudo apt-get install -y nodejs
```

## yarn 설치

```bash
$ npm install --global yarn
```

## 실행시 포트 변경
 - .env 파일에 PORT=8000 을 쓴다.
```bash
$ PORT=8000 npm start
```
