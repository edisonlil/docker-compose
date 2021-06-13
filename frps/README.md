### FRPS

1.在根目录下创建`/etc/frp`目录
```
mkdir -p /etc/frp
``` 

2.在`/etc/frp`目录下创建`frps.ini`文件

 ```
[common]
server_addr=115.159.157.148
server_port=7000

[ssh]
type=tcp
local_ip=127.0.0.1
local_port=22
remote_port=6666

[web]
type=http
#local_ip=127.0.0.1
local_port=3000
custom_domains=www.example.top

 ```

3.执行`docker-compose`文件

```
docker-compose up -d
``` 