# 개요
 - ubuntu 시스템이 필요하나 각각 별도의 환경을 만들고 싶을 때 ubuntu 를 docker 에서 운용한다.
 - 이렇게 하며 여러 환경을 굳이 virtualbox 로 하지 않아도 되니 매우 요긴하다.
 - 참고로 아래의 명령어는 모두 root 권한으로 실행이 되나 (docker 특성) 편의상 user 권한으로 적어 둠
# 기본 수행

## start ubuntu using docker

```bash
$ docker run -it -d --name kubeflow ubuntu:20.04 bash

# bash 가 나오며 그냥 창을 닫는다. (그러면 bash 가 계속 떠 있고 종료되지 않는다.)

$ docker exec -it kubeflow bash
```

## 기본적을 설치하는 것들
 - sudo : 습관적으로 sudo 를 치니 귀찮아서
 - emacs , yaml-mode , curl , bash-completion

```bash
$ apt update
$ apt install -y sudo
$ apt install -y emacs-nox yaml-mode curl bash-completion
```

## gcloud install
 - https://cloud.google.com/sdk/docs/install#deb

```bash
$ sudo apt-get install apt-transport-https ca-certificates gnupg
$ echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
$ curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
$ sudo apt-get update && sudo apt-get install google-cloud-cli
```

