# 정리
 - systemd 를 사용하여 cron 과 같은 timer 구현
 - https://twpower.github.io/213-systemd-timer-example
 - https://hippogrammer.tistory.com/74
 - https://ggangjo.tistory.com/209
 - https://chhanz.github.io/linux/2019/01/18/linux-how-to-create-custom-systemd-service/


```bash
$ cat << EOF > ~/.config/systemd/user/at02_00am.timer
[Timer]
OnCalendar=*-*-* 02:00:00
Unit=music.playd.service

[Install]
WantedBy=default.target
EOF

$ systemctl --user enable music.playd.service
$ systemctl --user list-timers
```
