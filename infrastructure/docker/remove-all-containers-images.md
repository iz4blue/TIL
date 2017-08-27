# Docker 모두 깔끔하게 지우기
- 참고 페이지 : https://techoverflow.net/2013/10/22/docker-remove-all-images-and-containers/

# 모든 container 삭제하기
- docker rm $(docker ps -a -q)

# 모든 image 삭제하기
- docker rmi $(docker images -q)
