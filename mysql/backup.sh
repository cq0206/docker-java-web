#!/bin/bash
# 数据库用户名
USER=root
# 数据库密码
PASSWORD=yourpassword
# 备份数据库
DATABASENAME=mysql


# 备份文件名字，使用日期定义
TIME=`date +\%F`
#备份后的sql文件放置位置,与被挂载备份目录对应
dir=/backup

# crontab执行mysqldump命令进行备份
/usr/bin/mysqldump -u$USER -p$PASSWORD $DATABASENAME > /${dir}/${DATABASENAME}${TIME}.sql