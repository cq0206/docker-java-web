# https://hub.docker.com/r/library/mysql/tags/
FROM mysql:5.7
MAINTAINER wuweixiang <wuweixiang.alex@gmail.com>

# 将数据库备份脚本放到容器
COPY backup.sh /usr/local


# cron 配置计划任务的书写格式
# # .---------------- minute (0 - 59)
# # |  .------------- hour (0 - 23)
# # |  |  .---------- day of month (1 - 31)
# # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# # |  |  |  |  |
# # *  *  *  *  * user-name  command to be executed
# 分钟 小时 日 月 周 ［用户名］ 命令

# mysql官方镜像无cron服务, 需自行安装
RUN set -x \
	&& apt-get update \
	&& apt-get install -y cron \
	# 用非交互输入计划任务到cron服务中: 每天凌晨三点执行一次mysql备份操作
	&& crontab -u root -l; \
	echo '0 3 * * * root bash /usr/local/backup.sh' |crontab \
	# 赋予备份脚本执行权限
	&& chmod +x /usr/local/backup.sh \
	# 利用sed将启动cron服务的命令，插入到此容器的启动文件中的第二行
	&& sed -i '1a service cron start' /usr/local/bin/docker-entrypoint.sh

#&& 如果前一条命令失败 后面不会执行
# ; 前面不管执行成不成功 下面命令都执行
#|| 前面执行失败 就执行后面的命令,前面成功 后面命令不执行
# > 是输出到某个文本,会覆盖之前信息  >> 在文件最后添加   | 是命令与命令的合作
