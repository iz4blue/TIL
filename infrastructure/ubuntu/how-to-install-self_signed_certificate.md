# 개요
 - 사설로 발행한 인증서를 ubuntu 서버에 설치하여 활용한다.
 - 주로 docker registry 를 사설로 생성하거나
 - K8s 등을 운용할 때 주로 사용하게 된다.

## 방법
 - ca-certificates 툴을 설치한다
 - /usr/local/share/ca-certificates 폴더에 인증서를 복사한다.
 - update-ca-certifiacates 를 실행하여 인증서를 반영한다.
 - (필요시) docker 대몬을 재시작한다.

```bash
$ sudo apt-get install ca-certificates
$ sudo mkdir /usr/local/share/ca-certificates/k8s
$ sudo bash -c 'cat > /usr/local/share/ca-certificates/k8s/ca.crt'
$ sudo bash -c 'cat > /usr/local/share/ca-certificates/k8s/cluster.crt'
$ sudo update-ca-certificates

$ sudo systemctl restart docker
```
