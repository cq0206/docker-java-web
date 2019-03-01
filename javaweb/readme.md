方式一：
直接将war包放置./tomcat/webapps/下


方式二（实现中）: 
在./tomcat下通过 Shell脚本（通过Dockerfile去触发）
1. 将代码Clone到此目录下
2. 编译成war
3. 将war包放置./tomcat/webapps/下

方式三（待实现）：
此项目中添加源码目录，相对方式二 省去 获取源码过程 通过源码去构建