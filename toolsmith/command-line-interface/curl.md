# CURL 을 커멘드 라인에서 사용하는 것을 적어본다

# 참고 링크
- https://www.lesstif.com/pages/viewpage.action?pageId=14745703#curl설치및사용법-HTTPGET/POST,RESTAPI연계등-HTTPFORMPOST

# POST 방식의 데이터 요청하기 
- curl -X POST -d "csv_path=20170706/nickname.csv" -d "push_type=notice" 'https://admin.iz4blue.net/v2/users/get_user_tokens'
