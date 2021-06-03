### MongoDB

1.创建`/data/mongo/data/db`目录

```
mkdir -p /data/mongo/data/db
```

2.将`docker-compose.yml`中的`{USERNAME}`替换成初始化数据库 `root` 名称

3.将`docker-compose.yml`中的`{PASSWORD}`替换成初始化数据库`root`密码

4.执行`docker-compose`文件

```
docker-compose up -d
```