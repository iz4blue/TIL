# 개요
 - docker의 기본 폴더를 별도의 폴더로 변경하여 루트 디렉토리의 용량을 확보한다.

# 과정
 - docker 정지
 - 새로운 디스크의 파일 시스템 준비
 - 연결할 폴더 생성
 - 신규 디스크를 마운트
 - 기존에 있던 docker 파일을 그대로 복사
 - docker 시작 옵션을 변경하여 라이브러리 폴더를 신규 디스크 디렉토리로 변경
 - fstab 을 수정하여 리부팅 이후에도 연결되도록 작업

```bash
$ sudo systemctl stop docker
$ sudo systemctl status docker
$ sudo mkfs.ext4 /dev/sdb1
$ sudo mkdir /mnt/docker
$ sudo mount /dev/sdb1 /mnt/docker
$ rsync -avxP /var/lib/docker/ /mnt/docker
$ sudo emacs /lib/systemd/system/docker.service

# ExecStart 항목을 다음과 같이 수정함
ExecStart=/usr/bin/dockerd -g /home/docker -H fd:// --containerd=/run/containerd/containerd.sock

$ sudo systemctl daemon-reload
$ systemctl start docker

$ sudo emacs /etc/fstab
```
