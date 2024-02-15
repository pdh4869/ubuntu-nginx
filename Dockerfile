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
