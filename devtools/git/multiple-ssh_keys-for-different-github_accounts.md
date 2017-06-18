# repository 별로 ssh-key 를 다르게 쓰자
- 회사 계정과 개인 계정이 ssh-key 가 달라야 함으로 귀찮은 점 존재
- repository 별로 ssh-key 를 다르게 쓸수 있지는 않을까? 고민하다가 방법이 있을 듯 하여 아이디어 검증 차원에서 시작함

# 구상한 방법
- ssh 는 config 파일을 사용할 수 있다.
- git 의 origin 설정은 repository 별로 다르게 할 수 있다.
- 그렇다면 처음 clone 부터 origin 설정이 특이하게 따라가게 하면 어떨까?

# 테스트
- ssh 의 config 를 다음과 같이 잡는다.

```
Host iz4blue.github.com
    HostName github.com
    IdentityFile ~/.ssh/iz4blue-id_rsa

Host nbt.github.com
    HostName github.com
    IdentityFile ~/.ssh/nbt-josephkim-id_rsa
```
- git clone 을 사용할 때 부터 상황에 맞게 주소를 바꿔서 가져오자

```
git clone git@iz4blue.github.com:iz4blue/TIL.git
```
- git push 성공을 확인!

```
touch test
git add test
git commit -m "commit test"
git push
```
- 기존의 repository 도 .git/.config 를 수정하여 잘 됨을 확인

