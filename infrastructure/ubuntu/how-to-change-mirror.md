# 개요
 - 시간이 오래되어 접속이 되지 않는 apt 저장소를 변경한다.
 - 또는 너무 느린 속도의 apt 저장소를 변경한다.

# 방법
 - /etc/apt/sources.list 에서 기존에 설정되어 있는 저장소를 변경한다.
 - vi 를 사용하여 텍스트를 치환한다.
 - `:%s/kr.archive.ubuntu.com/mirror.kakao.com/g`

