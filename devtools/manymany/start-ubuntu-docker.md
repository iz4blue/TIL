# 개요
 - ubuntu 시스템이 필요하나 각각 별도의 환경을 만들고 싶을 때 ubuntu 를 docker 에서 운용한다.
 - 이렇게 하며 여러 환경을 굳이 virtualbox 로 하지 않아도 되니 매우 요긴하다.
 - 참고로 아래의 명령어는 모두 root 권한으로 실행이 되나 (docker 특성) 편의상 user 권한으로 적어 둠
# 기본 수행

## start ubuntu using docker
 - 한글을 쓰기 위해 인코딩 설정을 추가한다.
 - 또는 Dockerfile 에 ENV LC_ALL=C.UTF-8 을 추가한다.
 - https://www.joinc.co.kr/w/Site/Linux/Locale
```bash
$ docker run -it -d --name kubeflow ubuntu:20.04 bash

# bash 가 나오며 그냥 창을 닫는다. (그러면 bash 가 계속 떠 있고 종료되지 않는다.)

$ docker exec -it -e LC_ALL=C.UTF-8 kubeflow bash
```

## start ubuntu using Docker Out Of Docker
 - 실제 사용하려는 것이 Docker 안에서 ubuntu 를 띄워서 Docker 를 쓰려는 것이면
 - Host 의 Docker 내용을 공유해서 사용하는 것이 필요하다.
 - 다만 이 때는 Docker 안에 Docker 를 운영하는 것이 아니니 이미지 작업등이 필요한 경우에만 쓰자

```bash
$ docker run -it -d -v /var/run/docker.sock:/var/run/docker.sock --name DooD ubuntu:20.04 bash

$ docker exec -it -e LC_ALL=C.UTF-8 DooD bash
```

## 기본적을 설치하는 것들
 - sudo : 습관적으로 sudo 를 치니 귀찮아서
 - emacs , yaml-mode , curl , bash-completion , less

```bash
$ apt update
$ apt install -y sudo
$ apt install -y emacs-nox yaml-mode curl bash-completion less
```

## gcloud install
 - https://cloud.google.com/sdk/docs/install#deb

```bash
$ sudo apt-get install apt-transport-https ca-certificates gnupg
$ echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
$ curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
$ sudo apt-get update && sudo apt-get install google-cloud-cli
```

