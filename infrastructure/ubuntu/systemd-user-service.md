# 일반
 - systemd 설정을 user 영역에 활용할 수 있게 함
 - https://linux.systemv.pe.kr/systemd-user-사용하기/

```bash

$ mkdir -p ~/.config/systemd/user
$ cat << EOF > ~/.config/systemd/user/music.playd.service
[Unit]
Description=Music Play Daemon
After=network.target ssh.service
Wants=ssh.service

[Service]
Type=simple
ExecStart=/home/pi/music/play.sh
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
$ systemctl --user start music.playd.service
$ systemctl --user enable music.playd.service
```
