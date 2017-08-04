FROM jupyter/scipy-notebook

MAINTAINER kosta.zabashta@gmail.com

USER root

LABEL version="spark2.2.0"
ARG SPARK_VERSION=spark-2.2.0-bin-hadoop2.7

ENV SPARK_HOME /opt/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip

# Download & install dependencies
RUN apt-get update \
    && apt-get -f install \
    && apt-get -y install software-properties-common \
    && apt-get -y install wget
# Install Java
RUN echo 'deb http://cdn-fastly.deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get -y update && \
    apt-get install --no-install-recommends -t jessie-backports -y openjdk-8-jre-headless ca-certificates-java && \
    rm /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download Spark
RUN wget http://d3kbcqa49mib13.cloudfront.net/${SPARK_VERSION}.tgz
# Extract Spark
RUN tar -xzf ${SPARK_VERSION}.tgz
# Clean up
RUN rm ${SPARK_VERSION}.tgz
# Move Spark to otp directory
RUN mv ${SPARK_VERSION} /opt/spark

# Web UI
EXPOSE 8080
# Spark
EXPOSE 7077
# REST
EXPOSE 6066

RUN chown -R root:root $SPARK_HOME