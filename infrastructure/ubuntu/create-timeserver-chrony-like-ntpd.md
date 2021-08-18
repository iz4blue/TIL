# 정리
 - ubuntu 에서 ntpd 가 아니 chrony 를 권장하고 있다.
 - 최대한 공식문서를 기준으로 설정하는 법을 정리함
 - https://ubuntu.com/server/docs/network-ntp
 - https://www.pool.ntp.org/zone/kr

## 한국 ntp 서버
 - kr.pool.ntp.org
 - 2.kr.pool.ntp.org
 - 2.asia.pool.ntp.org
 - 3.asia.pool.ntp.org

## 설정

### ubuntu client 설정은
 - 이전에 작성된 글 확인 : ubuntu time client


### ubuntu chronyd 설정
 - 설치
 - 설정 파일 수정 /etc/chrony/chrony.conf
   - pool 등록
   - 타임 서버 ip 등록 192.168.0.241
   - 허용 등록 192.168.0.0/24

```bash
$ sudo apt install chrony

$ sudo emacs /etc/chrony/chrony.conf

pool kr.pool.ntp.org iburst
pool 2.kr.pool.ntp.org iburst
pool 2.asia.pool.ntp.org iburst
pool 3.asia.pool.ntp.org iburst

server 192.168.0.241
allow 192.168.0.0/24

$ sudo systemctl restart chrony.service

$ chronyc sources
chronyc sources

MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^+ gamma.rueckgr.at              2   8   377   135  -1048us[-1048us] +/-   29ms
^- 2b.ncomputers.org             2   8   377   204  -1141us[-1124us] +/-   50ms
^+ www.kashra.com                2   8   377   139  +3483us[+3483us] +/-   18ms
^+ stratum2-4.NTP.TechFak.U>     2   8   377   143  -2090us[-2073us] +/-   19ms
^- zepto.mcl.gg                  2   7   377     9   -774us[ -774us] +/-   29ms
^- mirrorhost.pw                 2   7   377    78   -660us[ -660us] +/-   53ms
^- atto.mcl.gg                   2   7   377     8   -823us[ -823us] +/-   50ms
^- static.140.107.46.78.cli>     2   8   377     9  -1503us[-1503us] +/-   45ms
^- 4.53.160.75                   2   8   377   137    -11ms[  -11ms] +/-  117ms
^- 37.44.185.42                  3   7   377    10  -3274us[-3274us] +/-   70ms
^- bagnikita.com                 2   7   377    74  +3131us[+3131us] +/-   71ms
^- europa.ellipse.net            2   8   377   204   -790us[ -773us] +/-   97ms
^- tethys.hot-chilli.net         2   8   377   141   -797us[ -797us] +/-   59ms
^- 66-232-97-8.static.hvvc.>     2   7   377   206  +1669us[+1686us] +/-  133ms
^+ 85.199.214.102                1   8   377   205   +175us[ +192us] +/-   12ms
^* 46-243-26-34.tangos.nl        1   8   377   141   -123us[ -106us] +/-   10ms
^- pugot.canonical.com           2   8   377    21    -95us[  -95us] +/-   57ms
^- alphyn.canonical.com          2   6   377    23  -1569us[-1569us] +/-   79ms
^- golem.canonical.com           2   7   377    92  -1018us[-1018us] +/-   31ms
^- chilipepper.canonical.com     2   8   377    21  -1106us[-1106us] +/-   27ms

$ chronyc sourcestats

210 Number of sources = 20
Name/IP Address            NP  NR  Span  Frequency  Freq Skew  Offset  Std Dev
==============================================================================
gamma.rueckgr.at           25  15   32m     -0.007      0.142   -878us   106us
2b.ncomputers.org          26  16   35m     -0.132      0.283  -1169us   256us
www.kashra.com             25  15   32m     -0.092      0.259  +3426us   195us
stratum2-4.NTP.TechFak.U>  25  14   32m     -0.018      0.130  -2056us    96us
zepto.mcl.gg               13  11   21m     +0.148      0.196   -683us    66us
mirrorhost.pw               6   5   645     +0.117      0.445   -591us    19us
atto.mcl.gg                21  13   25m     -0.069      0.199   -904us   103us
static.140.107.46.78.cli>  25  18   34m     -0.005      0.094  -1526us    78us
4.53.160.75                25  10   32m     +0.412      0.110    -11ms    84us
37.44.185.42               24  12   30m     -0.983      0.173  -3718us   122us
bagnikita.com              17   7   31m     -0.132      0.217  +3527us   139us
europa.ellipse.net         26  15   35m     +0.038      0.553   -473us   424us
tethys.hot-chilli.net      25  11   32m     -0.094      0.110   -864us    88us
66-232-97-8.static.hvvc.>  20  11   35m     -0.116      0.165  +1561us   109us
85.199.214.102             26  11   35m     -0.054      0.390   +129us   343us
46-243-26-34.tangos.nl     25  16   32m     +0.129      0.297   -307us   198us
pugot.canonical.com        25  14   34m     -0.271      0.176   -143us   135us
alphyn.canonical.com       17  11  1100     -0.087      0.360  -1749us   114us
golem.canonical.com        23  12   30m     +0.057      0.370   -988us   229us
chilipepper.canonical.com  25  18   34m     -0.084      0.224  -1116us   169us

```


