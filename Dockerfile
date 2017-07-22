FROM ubuntu:16.04

MAINTAINER kosta.zabashta@gmail.com

LABEL version="spark2.2.0"

# Download & install dependencies
RUN apt-get update \
    && apt-get -f install \
    && apt-get --assume-yes install wget

# Download Spark
RUN wget -q http://apache.mirror.triple-it.nl/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz \
&&  tar -xzf spark-2.2.0-bin-hadoop2.7.tgz \
&&  mv spark-2.2.0-bin-hadoop2.7.tgz /opt/spark