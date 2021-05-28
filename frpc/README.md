### FRPC

1. 在当前目录下创建`frpc.ini`配置文件

```smartyconfig

[common]
server_addr=115.159.157.148
server_port=7000

#[ssh]
#type=tcp
#local_ip=127.0.0.1
#local_port=22
#remote_port=6666

[lee-yapi]
type=http
#local_ip=127.0.0.1
local_port=3000
custom_domains=www.frpcproxy.com

```


2. 执行`docker-compose`文件

```shell script
docker-compose up -d
```