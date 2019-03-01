# 安装maven
FROM maven:3.3.9-jdk-8

# 设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# china mirrors
COPY sources.list /etc/apt/sources.list
COPY settings.xml /usr/share/maven/ref/

# 拷贝部署脚本到镜像
COPY build.sh /tmp/