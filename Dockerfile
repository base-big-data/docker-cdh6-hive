FROM ccinn/cdh6:latest

LABEL maintainer="Caiwenhui <471113744@qq.com>"

USER root

ADD bin/support.sh /bin/
ADD bin/run.sh /bin/

# 安装元数据存储服务 postgres
RUN source /bin/support.sh;\
  loop_exec 'yum install -y hive hive-metastore postgresql-jdbc' ;\
  ln -s /usr/share/java/postgresql-jdbc.jar /usr/lib/hive/lib/postgresql-jdbc.jar

ADD conf/hive-site.xml /etc/hive/conf/

WORKDIR /

CMD ["/bin/run.sh"]