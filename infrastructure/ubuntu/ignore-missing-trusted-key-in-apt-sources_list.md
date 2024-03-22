# 개요
 - gpg key 가 변경이 되었으나 repository 관리자가 key 변경을 하지 않았을 때 난감한 상황일 때 임시로 조치하는 법
 - 힌트 : https://askubuntu.com/questions/74345/how-do-i-bypass-ignore-the-gpg-signature-checks-of-apt

```bash
$ sudo apt -o Acquire::AllowInsecureRepositories=true \
    -o Acquire::AllowDowngradeToInsecureRepositories=true \
    update
$ sudo apt-get -o APT::Get::AllowUnauthenticated=true install gcsfuse
```
