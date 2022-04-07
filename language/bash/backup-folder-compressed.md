# 개요
 - 파일이 많고 작은 파일로 이루어진 폴더 구조를 백업해야할 때
 - 일단 루트 폴더 기준으로 백업을 하는데, 좋은 구조는 아님


```bash
#!/bin/bash
set -e

pushd ./source

cnt=0
for d in */; do
  cnt=$(($cnt + 1))
  foldername=$(basename -- "${d}")
  date
  echo "${cnt}:" "$foldername"

  pushd ${foldername} && popd && tar -I pigz -cf ../work/2022-04-06/${foldername}.tar.gz ./${foldername}

done


```
