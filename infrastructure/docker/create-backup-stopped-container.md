# 개요
 - 중지된 컨테이너 이미지를 백업하자
 - 중지된 컨테이너를 당연히 지워야 하지만 혹시나 하는 마음에 백업이 필요하다면 파일로 저장해두자


## 방법
 - 컨테이너를 이미지화 하기 위해 커밋을 하고
 - 생성된 이미지를 save 로 tar 화 한다

```bash
$ cat container-backup.sh
#!/bin/bash

OFFSET=p100-backup
CONTAINER=79f5f02be838
FILENAME=gracious_mendel

docker container inspect ${CONTAINER} >> ${OFFSET}-${FILENAME}.txt
docker commit -p ${CONTAINER} ${OFFSET}-${FILENAME}
docker save -o ${OFFSET}-${FILENAME}.tar ${OFFSET}-${FILENAME}
gzip ${OFFSET}-${FILENAME}.tar
docker rm ${CONTAINER}

```

