### pometheus

1.在根目录下创建`/usr/local/src/config`目录
```
mkdir -p /usr/local/src/config
``` 

2.将`config`目录下的 ` node_down.yml  prometheus.yml` 文件移至`/usr/local/src/config`目录下


### alertmanager

3.将`config`目录下的 ` alertmanager.yml` 文件移至当前目录下 

4.执行`docker-compose`文件
```
docker-compose up -d
```