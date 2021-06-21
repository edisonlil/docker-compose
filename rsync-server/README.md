# Rsync 服务端

启用`rsync`远程服务器...s

执行以下命令可了解`rsync`命令。
```shell
man rsync
```


1.创建`rsyncd.conf`文件,并挂载到容器的`/etc`目录中

```config
#用户 远端命令使用rsync访问共享目录
uid = root
#用户组
gid = root
#安全相关
use chroot = no
#最大连接数
max connections = 200
#超时时间（不进行备份多长时间断开）
timeout = 300
#进程对应进程号文件（存放服务运行时进程id号）
pid file = /var/run/rsyncd.pid
#锁文件
lock file = /var/run/rsync.lock
#日志文件，显示出错信息
log file = /var/log/rsyncd.log

#模块信息
[data]
comment = "data dir by edison"
#模块对应的位置(路径)
path = /data
#忽略错误程序
ignore errors
read only = false
list = false
#主机白名单
#hosts allow = 0.0.0.0/32
#主机黑名单
#hosts deny = 0.0.0.0/32
#rsync服务端认证用户
auth users = admin
#设置进行连接认证的密钥文件:
secrets file = /etc/rsync.password
```

2.创建`rsync.password`文件,并挂载到容器的`/etc`目录中
```textmate
auth_users:password
```

3.创建文件挂载目录并挂载到容器的`/data`目录

4.执行`docker-compose`文件

```shell script
docker-compose up -d
```