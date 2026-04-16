# 개요
- 시스템 시작시 밀려 있던 systemd 데몬이 모두 한꺼번에 뜨면 문제가 될 수 있는 것이 있음
- 만약 밀려 있던 특정 프로세스를 띄우기 위해서 일정 시간 딜레이를 주고 싶다면?


## 다음 작업을 수행

```bash
$ sudo systemctl edit logrotate.timer

[Timer]
OnBootSec=15min

$ systemctl cat logrotate.timer
# /lib/systemd/system/logrotate.timer
[Unit]
Description=Daily rotation of log files
Documentation=man:logrotate(8) man:logrotate.conf(5)

[Timer]
OnCalendar=daily
AccuracySec=1h
Persistent=true

[Install]
WantedBy=timers.target

# /etc/systemd/system/logrotate.timer.d/override.conf
[Timer]
OnBootSec=5min

```


