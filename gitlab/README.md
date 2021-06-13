#### gitlab

1.在根目录下创建`/etc/gitlab/trusted-certs`目录
```
mkdir -p /etc/gitlab/trusted-certs
``` 

2.将`config`目录下的文件移至`/etc/gitlab`目录下


3.执行`docker-compose`文件

```
docker-compose up -d
```