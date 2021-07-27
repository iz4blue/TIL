# 스터디 환경을 만들기 위해 발췌 하였습니다.
## 컨테이너 인프라 환경 구축을 위한 쿠버네티스/도커
 - 교보문고 : http://www.kyobobook.co.kr/product/detailViewKor.laf?barcode=9791165215743
 - 리디북스 : https://ridibooks.com/books/754031863

# 2 테스트 환경 구성하기
## 2.1.1 virtualbox 설치
https://www.virtualbox.org/wiki/Downloads

## 2.1.2 Vagrant 설치
https://www.vagrantup.com/downloads

## 2.1.3 Vagrant 구성하고 테스트 하기

 - 작업을 수행할 원하는 폴더 생성 및 들어가기
 - vagrant init 수행
 - Vagrant 동작 확인
   - vagrant up 을 실행하면 에러가 발생함
 - Vagrantfile 확인
   - config.vm.box = “base”
   - base 라는 이미지가 없어서 fail 됨
 - Vagrant 동작 확인 및 첫 VM 생성
   - https://app.vagrantup.com/boxes/search 주소에서 “sysnet4admin/CentOS-k8s” 이미지 찾기고 그 내용으로 Vagrantfile 수정
   - config.vm.box = “sysnet4admin/CentOS-k8s” 으로 변경
   - vagrant up 실행
   - “Vagrant was unable to mount VirtualBox shared folders” 에러가 나는 것은 무시함 vboxsf 관련 파일 시스템이 필요함
   - virtualbox 에 새로운 VM 이 생성되려고 하였는지 확인을 함
   - vagrant ssh 를 수행하여 새롭게 설치된 vm 에 접속되는지 확인
   - vm 에서 uptime , cat /etc/redhat-release 를 수행해보고 원하는 것이 잘 동작하는지 확인
   - 결과로 CentOS Linux release 7.8.2003 (Core)
   - exit 로 vm 의 shell 에서 나옴
 - vagrant destroy -f 수행하여 만들어진 vm 삭제

## 2.2.1 가상 머신에 필요한 설정 자동으로 구성하기
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.1/Vagrantfile
 - vagrant up 실행
 - vagrant ssh 실행
 - vm 에서 ip addr show eth1 으로 192.168.1.10 확인
 - vm 에서 exit 로 나오기

## 2.2.2 가상 머신에 추가 패키지 설치하기
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.2/Vagrantfile
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.2/install_pkg.sh
 - vagrant provision 실행
 - vagrant ssh 로 vm 접속
 - vm 에서 yum repolist 로 epel 이 추가 되었는지 확인
 - vm 에서 vi .bashrc 로 vim 하일라이트 적용되었는지 확인
 - vm 에서 exit 로 나오기
 - vagrant destroy -f 로 vm 지우기

## 2.2.3 가상 머신 추가로 구성하기
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.3/Vagrantfile
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.3/install_pkg.sh
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.3/ping_2_nds.sh
 - 다음 url 에 있는 내용을 입력
https://github.com/sysnet4admin/_Book_k8sInfra/blob/main/ch2/2.2.3/config.sh

 - vagrant up 실행
 - vagrant ssh m-k8s 로 vm 접속
 - vm 에서 ./ping_2_nds.sh 실행
 - vm 에서 exit 로 나오기

# 2.3 터미널 프로그램으로 가상 머신 접속하기
## 2.3.1 푸티 설치하기
https://www.chiark.greenend.org.uk/~sgtatham/putty/

## 2.3.2 슈퍼푸티 설치하기
https://github.com/jimradford/superputty

