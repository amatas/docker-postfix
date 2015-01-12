FROM centos:centos7.0.1406

MAINTAINER Alfredo Matas "amatas@gmail.com"

RUN yum install -y epel-release && \
    yum install -y postfix cyrus-sasl-lib cyrus-sasl-plain cyrus-sasl syslog-ng && \
    sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf

ADD postfix /postfix

EXPOSE 25

CMD ["/postfix/run"]
