# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Joost Lek <vlabakje@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# JDK install
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/jdk-8u33-linux-arm-vfp-hflt.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u33-b05/jdk-8u33-linux-arm-vfp-hflt.tar.gz
RUN tar -zxC /opt -f /tmp/jdk-8u33-linux-arm-vfp-hflt.tar.gz
RUN ln -s /opt/jdk1.8.0_33 /opt/jdk8
RUN ln -s /opt/jdk8/bin/java /bin/

RUN apt-get update && apt-get install -y \
    unzip \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# install openhab runtime
ADD distribution-2.0.0-SNAPSHOT-runtime.zip /opt/
RUN mkdir /opt/openhab2-snapshot; cd /opt/openhab2-snapshot; unzip ../distribution-2.0.0-SNAPSHOT-runtime.zip
# MQTT port
CMD ["/opt/openhab2-snapshot/start_debug.sh"]

