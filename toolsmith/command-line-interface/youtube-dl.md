# 음악 받기

## youtube-dl 음악만 받는 옵션
```bash
$ youtube-dl -f 'bestaudio[ext=m4a]' 'http://youtu.be/hTvJoYnpeRQ' --output "%(id)s.%(ext)s"
```
