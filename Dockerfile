FROM oraclelinux:7-slim

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-8.0.13
ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.13

RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
     https://repo.mysql.com/mysql-community-release-el7.rpm \
    && yum-config-manager --enable mysql80-server-minimal \
    && yum install -y $MYSQL_SERVER_PACKAGE $MYSQL_SHELL_PACKAGE libpwquality \
    && yum clean all \
    && mkdir /docker-entrypoint-initdb.d

EXPOSE 3306 33060
CMD ["mysqld"]
