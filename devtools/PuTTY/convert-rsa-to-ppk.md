# 개요
 - rsa 형태로 작성된 private key 파일을 putty 에서 사용할 수 있도록 변경

# 방법
 - PuTTYgen 실행
 - Conversions > import key 선택으로 기존의 rsa 키 가져오기
 - "Save private key" 선택으로 원하는 위치에 ppk 파일 저장
 - PuTTY 에서 Connection > SSH > Auth 에서 사용할 "Private key" 지정

![import ssh-key](https://user-images.githubusercontent.com/979297/178918070-ffdc6747-ea7a-4d71-9831-ac1fb421dbfe.png)
