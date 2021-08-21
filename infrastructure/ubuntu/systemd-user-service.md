# 일반
 - systemd 설정을 user 영역에 활용할 수 있게 함
 - https://linux.systemv.pe.kr/systemd-user-사용하기/
 - https://wiki.archlinux.org/title/Systemd/User

```bash

$ mkdir -p ~/.config/systemd/user
$ cat << EOF > ~/.config/systemd/user/music.playd.service
[Unit]
Description=Music Play Daemon

[Service]
ExecStart=/home/pi/music/play.sh

[Install]
WantedBy=default.target
EOF

$ systemctl --user daemon-reload
$ systemctl --user start music.playd
$ systemctl --user enable music.playd
$ loginctl enable-linger $USER
```
