# Rsync 客户端

基于`rsync+inotify`实时同步目录文件到远程`rsync`服务器中。

执行以下命令可了解`rsync`命令。
```shell
man rsync
```

1.创建`config`文件,并挂载到容器的`/etc/rsync`目录中

```textmate
SOURCE_DIR=/data/

#远程模块名
REMOTE_DIR=data
#远程服务器IP
REMOTE_IP=192.168.1.178
#rsync 用户
REMOTE_USER=admin
#rsync 密码文件
REMOTE_PWD_FILE=/etc/rsync/rsync.password
```


2.创建`rsync.password`文件,并挂载到容器的`/etc/rsync`目录中
```textmate
remote rsync password!!!
```
3.创建文件挂载目录并挂载到容器的`/data`目录

4.执行`docker-compose`文件

```shell script
docker-compose up -d
```
