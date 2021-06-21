FROM centos
MAINTAINER author:edison
USER root
RUN yum update -y && yum install wget -y && yum -y install rsync
RUN wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo && yum install -y inotify-tools
COPY ./bin/transport.sh /usr/local/bin/transport.sh
COPY ./config/rsync.password /etc/rsync/rsync.password
COPY ./config/config /etc/rsync/config
RUN mkdir /data && chown -R root:root /data/ && chmod 755 /data
RUN chmod 777 /usr/local/bin/transport.sh && chmod 600 /etc/rsync/rsync.password
CMD transport.sh
