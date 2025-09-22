# 개요
- 일반 리눅스 터미널에서 SSH 접속이 가능한데 guacamole 에서는 접속이 안되는 이유
- 그 과정에서 간단히 알게된 ED25519 에 대한 간단한 소감

# 간단 요약
- 기존 접속인 RSA 암호화 방식 중 보안에 취약하다고 알려진 방식을 대상 서버에서 허가하지 않아 생기는 문제
- 일반 리눅스 터미널은 대부분 ssh-rsa 이후에 나온 rsa-sha2-256 , rsa-sha2-512 형태로 자동으로 접속함
- guacamole 의 경우는 rsa-sha2-256 , rsa-sha2-512 의 다음 버젼의 알고리즘 사용에 대해서 자동으로 사용 설정이 되어 있는 것 같지 않음
- 만약 guacamole 만 접속이 안되는 것 같다면 ED25519 형태로 생성된 키로 재 등록 해서 사용

# 기술적 도움
- 사용중인 키 종류 확인 법
- 확인에 도움이 된 로그들
- 서버에 설정된 sshd 동작 내용 확인
- /etc/ssh/sshd_config 수정 방법 (비권장)


## 키 종류 확인 법
- 출력 끝에 (RSA) 혹은 (ED25519) 확인 필요
```bash
$ ssh-keygen -l -f /path/to/your/private_key
```

## 로그 내용
- guacamole 에서는 다음과 같이 사용자 아이디와 퍼블릭키가 맞지 않다는 로그로 나와서 확인이 어려울 수 있음
- 리눅스에서 ssh 접속시 디버그 내용을 출력하면 서버에서 지원하는 암호화 키 방법이 나열됨
- 서버에서 확인을 해야 하기 때문에 쉽지 않을 수 있음

```text
No known host keys provided, host identity will not be verified.
Public key authentication failed: Username/PublicKey combination invalid
```

```text
sshd[2843103]: userauth_pubkey: key type ssh-rsa not in PubkeyAcceptedAlgorithms [preauth]
```

```bash
$ ssh -v test@test.com
.... 생략 ....
debug1: kex_ext_info_client_parse: server-sig-algs=<ssh-ed25519,sk-ssh-ed25519@openssh.com,ssh-rsa,rsa-sha2-256,rsa-sha2-512,ssh-dss,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ecdsa-sha2-nistp256@openssh.com,webauthn-sk-ecdsa-sha2-nistp256@openssh.com>
.... 생략 ....
```

## sshd 동작내용 확인

```bash
$ sshd -T | grep -i PubkeyAcceptedAlgorithms
```

## sshd 에 설정 내용 변경
- /etc/ssh/sshd_config 에 PubkeyAcceptedAlgorithms 옵션을 추가

```bash
$ sudo vi /etc/ssh/sshd_config

# 추가
PubkeyAcceptedAlgorithms +ssh-rsa
```

