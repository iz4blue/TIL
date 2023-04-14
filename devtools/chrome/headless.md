# 개요
 - headless chrome 을 ubuntu 에 설치한다.

## 방법
 - google-chrome-stable 버젼을 받고
 - 설치를 하되
 - no-install-recommends 를 포함해서 설치한다.

```bash
$ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
$ sudo apt install ./google-chrome-stable_current_amd64.deb --no-install-recommends
```
