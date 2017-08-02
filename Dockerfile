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
RUN apt-add-repository ppa:webupd8team/java -y \
&&  apt-get update -y \
&&  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
&&  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
&&  apt-get install -y oracle-java8-installer
# Define JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
# Download Spark
RUN wget http://d3kbcqa49mib13.cloudfront.net/${SPARK_VERSION}.tgz
# Extract Spark
RUN tar -xzf ${SPARK_VERSION}.tgz
# Clean up
RUN rm ${SPARK_VERSION}.tgz
# Move Spark to otp directory
RUN mv ${SPARK_VERSION} /opt/spark

EXPOSE 8080
RUN chown -R root:root $SPARK_HOME