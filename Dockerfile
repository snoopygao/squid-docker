FROM ubuntu:16.04
MAINTAINER snoopygao <gaoxing2000@gmail.com>
RUN apt-get update && \
	  apt-get clean  && \
    apt-get install -y squid3 && \
	  apt-get clean  && \
    mv /etc/squid/squid.conf /etc/squid/squid.conf.dist && \
    apt-get clean

ADD squid.conf /etc/squid/squid.conf
RUN mkdir /var/cache/squid
RUN chown -R proxy:proxy /var/cache/squid
RUN /usr/sbin/squid3 -N -z -F

EXPOSE 3128
