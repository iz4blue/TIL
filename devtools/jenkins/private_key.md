# 목적
- jenkins 로 배포를 할 때 ssh-key 를 숨기자
- 참고 url : https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use

```bash

export GIT_SSH_COMMAND="ssh -i $KEY_PATH"

ssh -T git@github.com

git clone git@github.com:nolgong-dev/typo-android.git

```
