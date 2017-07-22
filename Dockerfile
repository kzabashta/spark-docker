FROM ubuntu:16.04

MAINTAINER kosta.zabashta@gmail.com

LABEL version="spark2.2.0"

# Download & install dependencies
RUN apt-get update \
    && apt-get -f install \
    && apt-get -y install software-properties-common \
    && apt-get -y install wget

# Install Java
RUN apt-add-repository ppa:webupd8team/java -y \
&&  apt-get update -y \
&&  echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
&&  echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
&&  apt-get install -y oracle-java8-installer

# Define JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Download Spark
RUN wget http://apache.mirror.triple-it.nl/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
# Extract Spark
RUN tar -xzf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local
# Clean up
RUN rm spark-2.2.0-bin-hadoop2.7.tgz