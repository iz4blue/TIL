# 개요
 - vSphere 안에서 ubuntu 실행시 로그 파일에 수많은 multipathd 오류가 찍히는 현상
 - https://askubuntu.com/questions/1242731/ubuntu-20-04-multipath-configuration
 - https://sleeplessbeastie.eu/2021/01/06/how-to-fix-multipath-daemon-error-about-missing-path-when-using-virtualbox/
 - 방치하며 몇주만에도 1G 차는 상황이 발생함
```txt
Sep 10 01:15:46 anthos-ws multipathd[663]: sda: add missing path
Sep 10 01:15:46 anthos-ws multipathd[663]: sda: failed to get udev uid: Invalid argument
Sep 10 01:15:46 anthos-ws multipathd[663]: sda: failed to get sysfs uid: Invalid argument
Sep 10 01:15:46 anthos-ws multipathd[663]: sda: failed to get sgio uid: No such file or directory
```

## 조치
 - vSphere 의 VM 옵션에 다음을 추가하여 해결한다.
 - 설정 편집 > VM 옵션 > 고급 > 구성 매개 변수 _ 구성 편집 > 구성 매개 변수 추가
 - disk.EnableUUID = "TRUE"

![disk_EnableUUID](https://user-images.githubusercontent.com/979297/132785363-c53654ff-fbb2-46b5-bab9-2ea74279a701.png)

