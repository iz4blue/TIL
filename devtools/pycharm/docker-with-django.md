# 하고 싶었던 것
- 시스템 구성에 영향을 주지 않고 docker 에만 remote 로 작업하고 싶었음
- 이미 구성된 파일이 아니고 처음부터 시작하는 방법을 만들고 싶었음
- mac 에서만 테스트 해봤음
- PyCharm 유료버젼만 지원이 됨 참고
- 대부분 docker composer 로 안내를 해주는데 쉽게 이해하기 힘들어서 추후 다시 도전 하겠음
- 틀린 부분이 많을 것이나 일단 올립니다

# Docker for Mac 설치
- https://www.docker.com/docker-mac
- 기본 명령어는 설명하지 않을께요.

# PyCharm 에서 준비할 것

## 그냥 빈폴더 준비
- 이유는 ide 에서 제공해주는 템플릿을 사용하려면 시스템에 설치된 python 버젼을 맞춰주어야 하기 때문에 그것이 싫었음
- 그냥 특정 폴더에 mkdir 으로 빈 폴더 생성 : 여기서는 docker-django
- Welcom to PyCharm 에서 Open 으로 빈 폴더 열기

## remote interpreter 환경 준비
- Configure > Project: docker-django > Project Interpreter 에서 톱니바퀴 클릭 > Add Remote 선택
- Docker 선택
- New 버튼 선택
- Name 에는 Docker-local 으로 구분이 가능하도록 설정, Docker for Mac 이 우리가 원하는 설정
- Image name 은 원하는 이미지 기입 : 여기서는 python:3 를 사용
- Python interpreter path 는 python 으로 기본 값 사용
- 그런뒤 Project Interpreter 를 python:3 의 인터프리터를 설정
- 그러면 자동으로 python:3 docker 이미지를 받기 시작함

## Dockerfile 설정
- 지금의 작업 폴더에서 New File 로 Dockerfile 내용 설정
- 자세한 내용은 Dockerfile 에 있는 코멘트 참조

## requirements.txt 작성
- 우리는 django 를 설치할 것이기 때문에 requirements 에 필요한 django 를 기입
- 필요한 것은 추가로 기입
- 우선 django 관련 Install requirement 가 뜨는 것은 무시 : 시스템 python 에 관련 패키지가 없기 때문임 우리는 docker 안에 라이브러리를 설치할 것이기 때문에 무시

## 도커 이미지 첫 생성 및 django 프로젝트 템플릿 생성
- Run > Edit Configurations 선택
- + 아이콘을 눌러 Docker Deployment 선택 : 첫 docker 이미지 생성 및 django 프로젝트 템플릿 생성을 위한 실행 환경을 만들 예정
- Deplyment 에서 Server 는 위에서 생성한 Docker-local 이 이미 선택되어 있음
- Name 은 django-startproject 로 생성
- Image tag 와 Container name 은 원하는 것으로 기입, 단 밑에서 다시 사용할 것이기 때문에 꼭 기억할 것 : docker-django 와 django-web 으로 사용
- Container 에서 필요한 추가 설정을 함
- Command 는 python3 django-admin startporject first_django 으로 입력
- Port bindings 는 이번에는 django 템플릿만 설치할 것이기 때문에 이번에는 입력할 필요 없음
- Volume bindings 에서는 위의 docker 파일에서 설정한 code 경로를 지정하고 Host Path 에는 절대 경로로 선택해줌
- + 를 눌러서 Container path 는 /code 로 Host path 는 현재 폴더를 쓸 것이기 때문에 공란으로 둠

## 도커 실행환경을 처음으로 해봄
- django-startproject 를 run 함
- 만약에 실행이 안되면 docker plugin 이 설치가 안된 것일 수 있으니 PyCharm 재시작

## 성공했는지 확인
- 만약 정상적으로 동작했다면 Project 파일 리스트에 mysite 폴더가 들어와 있을 것임

# django 실행환경 설정
## 생성된 django 파일을 실행 시킴
- Run > Edit Configurations 를 선택하고 + 를 누르고 Docker Deployment 를 눌러 새로운 Task 를 만듬
- Name 은 django-runserver 로 작성
- Image tag 와 Container name 은 위에서 설정한 것과 같이 docker-django 와 django-web 으로 사용
- Command 는 이제 서버를 실행할 것이기 때문에 python manage.py runserver 0.0.0.0:8000 을 사용
- Port bindings 에는 이제 Container 8000 과 Host 8000 을 연결함
- 위에서 사용했던 Volume bindings 도 동일하게 설정 함

## django-runserver task 실행
- migrate 가 안되어 있다는 경고가 있지만 우선 그건 무시하기로 함
- 브라우져로 http://localhost:8000/ 페이지를 열어서 페이지가 잘 열리는지 확인

