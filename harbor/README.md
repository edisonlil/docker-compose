### HARBOR


1. 配置`harbor.yml`文件


2. 赋予`install.sh` 和 `prepare` 脚本可执行权限 (只需执行一次，后续可直接跳过该步骤)
   
```shell script
chmod 777 ./install.sh | chmod 777 ./prepare
```

3. 执行`install.sh`脚本进行安装`harbor`
```shell script
./install.sh
```

----


关闭`harbor`仓库

```shell script
docker-compose down
```