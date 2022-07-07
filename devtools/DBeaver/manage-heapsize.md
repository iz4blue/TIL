# 개요
 - DBeaver 를 사용할 때 무거운 쿼리를 수행하는 경우 "java heap space" 의 오류가 나면서 멈추는 경우
 - 설정을 변경해서 heapsize 를 모니터링하고
 - 문제가 발생한다면 실행 옵션을 변경하여 대처하자.

# 방법

## heap 사용량 확인하기
 - Preferences > General > "Show heap status" 켜기
 - 그러면 하단 툴바의 오른쪽 부분에 heap 사용량이 실시간으로 보여지게 된다.

## mac 에서 java 실행 옵션 변경하기
 - /Applications/DBeaver.app/Contents/Eclipse/dbeaver.ini 파일을 수정하여 실행 옵션 변경
 - Xmx 옵션을 변경하여 대응 : 기본은 1024m 혹은 2048m 인데 이것을 시스템에서 사용가능한 만큼 변경

```bash
% cd /Applications/DBeaver.app/Contents/Eclipse
% vi dbeaver.ini
```
