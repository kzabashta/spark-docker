[![](https://images.microbadger.com/badges/image/kz85/spark-docker.svg)](https://microbadger.com/images/kz85/spark-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/kz85/spark-docker.svg)](https://microbadger.com/images/kz85/spark-docker "Get your own version badge on microbadger.com") [![Build Status](https://travis-ci.org/kzabashta/spark-docker.svg?branch=master)](https://travis-ci.org/kzabashta/spark-docker)


# spark-docker
This Docker image helps to run the Spark in a cluster mode with a master and variable slave (worker) nodes.

## Installation
0. Setup Docker and docker-compose first
1. Build the image using included Dockerfile ```docker-compose build```
2. Spin up a Spark cluster with 1 master and 2 slaves (as an example) ```docker-compose up --scale master=1 --scale slave=2```
3. Verify that the cluster is running by going to http://docker-machine-ip:8080. *Note: if you are running Docker on OS X or Windows, replace localhost with the docker host VM IP address. You can get the IP address by running* ```docker-machine ip```.
4. Verify that Jupyter notebook server is running by going to http://docker-machine-ip:8888
5. Destroy the cluster ```docker-compose down```

## Test

```
import pyspark
conf = pyspark.SparkConf()

conf.setMaster("spark://<docker machine IP>:7077")
conf.setAppName('test')

sc = pyspark.SparkContext(conf=conf)

rdd = sc.parallelize(range(100))
print(rdd.reduce(lambda x,y: x+y))
```

## TODO
Need to add support for the following components:
- [ ] Scala
- [x] PySpark
- [ ] HDFS
- [ ] Zeppelin
- [x] Jupyter
- [ ] Instructions on setting up in Azure/AWS with Docker Swarm
- [ ] Run containers in some kind of process manager