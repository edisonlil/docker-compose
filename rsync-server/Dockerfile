FROM centos
MAINTAINER author:edison
USER root
RUN yum -y install rsync
COPY ./config/rsyncd.conf /etc/rsyncd.conf
COPY ./config/rsync.password /etc/rsync.password
COPY ./bin/rsync-server.sh /usr/local/bin/rsync-server.sh
RUN mkdir /data && chown -R root:root /data/ && chmod 755 /data
RUN chmod 777 /usr/local/bin/rsync-server.sh && chmod 600 /etc/rsync.password
ENV RSYNC_PASSWOED=123456
EXPOSE 873
CMD rsync-server.sh
