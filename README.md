d# Install nginx into ubuntu
<hr />

## ubuntu pull from docker hub, run 
```
sudo docker pull ubuntu:22.04
sudo docker run -itd --name d-ubuntu -p 8001:80 ubuntu:22.04
```
## install nginx
```
// wsl 터미널
sudo docker exec -it d-ubuntu bash

// docker bash shell 내
apt update
apt install nginx
```
<hr />

## Install using Dockerfile 
```
// Dockefile
FROM ubuntu:22.04

RUN apt update
RUN apt install vim -y
RUN apt install iputils-ping -y
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# 호스트와 공유할 디렉토리 목록
VOLUME ["/data", "/etc/nginx/site-enabled", "/var/log/nginx"]

# CMD에서 설정한 실행 파일이 실행될 디렉토리
WORKDIR /etc/nginx

# 컨테이너가 시작되었을 때 실행할 실행 파일 or shell script
CMD ["nginx"]

# 호스트와 80, 443번 포트 번호를 연결
EXPOSE 80
EXPOSE 443

// build & run
sudo docker build -t ubuntu-nginx:0.1.0 . -f Dockerfile   // . 필수로 작성
sudo docker run -itd --name u-nginx -p 8002:80 d7fbd60033eb   // 이미지 id

sudo docker exec -it u-nginx bash  // bash shell 진입하여 확인
```

<hr />

## nginx test
```
// start nginx
nginx -c /etc/nginx/nginx.conf

// nginx -s signal test
nginx -s reload

```

<hr />

## result

![image](https://github.com/pdh4869/ubuntu-nginx/assets/76561901/d4d1e3ce-2c57-4b02-bb0c-575940b5a826)

<br />

![image](https://github.com/pdh4869/ubuntu-nginx/assets/76561901/511c4a2e-45b2-4797-b8fc-2fdf038b520d)

