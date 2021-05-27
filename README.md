### 项目介绍

本项目主要用于收集一些自己本身在开发中经常需要使用到的中间件容器部署方式。  该项目仅供参考模板，可根据自己的业务需求进行调整。

### Docker 安装

1.执行一下命令即可自动安装
```shell script
curl -sSL https://get.daocloud.io/docker | sh
```

2.启动docker
```shell script
systemctl start docker
```
3.设置开机自启动
```shell script
systemctl enable docker
```


### Docker Compose 安装

1.执行以下命令进行安装
```shell script
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
> Tips:要安装其他版本的 Compose，请替换 1.24.1。

2.将可执行权限应用于二进制文件
```shell script
sudo chmod +x /usr/local/bin/docker-compose
```

3.创建软链

```shell script
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

测试是否安装成功
```shell script
docker-compose --version
```