### svn

1.在当前目录下创建 `./svn/svn_repo` 目录

```
mkdir -p ./svn/svn_repo
```

2.在当前目录下创建 `./svn/svn_config` 目录

```
mkdir -p ./svn/svn_config
```

3.将 `config`目录下的 `logrotate.conf  rsyslog_docker.conf` 文件移至 `./common/config/log` 目录下


4.执行`docker-compose`文件
```
docker-compose up -d
```  