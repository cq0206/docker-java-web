#!/usr/bin/env bash
# 1.源码仓库地址
HTTP_URL=47.106.125.91/zhuoan/tao.magic.git
# 2.git用户名
GIT_USERNAME=qianpangzi
# 3.git密码
GIT_PASSWORD=***
# 4.分支选择
BRANCH=release
# 5.打包环境选择
MVN_ENV=pro
# 6.war包所在目录(TODO  要传送到   容器外的 tomcat/webapps下)
WEPAPPS_DIR=


# TODO 通过git获取源码（是否要安装git？）

git -b $BRANCH clone "http://"$GIT_USERNAME":"$GIT_PASSWORD"@"$HTTP_URL
# TODO 将源码拷贝至编译目录
cp -r /tmp/code /tmp/build

# TODO 下载依赖
cd /tmp/build && mvn dependency:resolve

# 构建应用
cd /tmp/build && mvn clean package -Dmaven.test.skip=true -P$MVN_ENV

# TODO 拷贝编译结果到指定目录
rm -rf $WEPAPPS_DIR/*
mv target/*.war $WEPAPPS_DIR/ROOT.war

# 清理编译痕迹
cd / && rm -rf /tmp/build
