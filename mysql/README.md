
### mysql

1.将`docker-compose.yml`中的`{PWD}`替换成自己当前数据库的root密码


2.在根目录下创建 `/data/mysql/data` 目录

```shell script
mkdir -p /data/mysql/data
```

3.在根目录下创建 `/etc/mysql` 目录

```shell script
mkdir -p /etc/mysql
```

4.执行`docker-compose`文件

```shell script
docker-compose up -d
```