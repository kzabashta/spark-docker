[![](https://images.microbadger.com/badges/image/kz85/spark-docker.svg)](https://microbadger.com/images/kz85/spark-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/kz85/spark-docker.svg)](https://microbadger.com/images/kz85/spark-docker "Get your own version badge on microbadger.com")

# spark-docker
This Docker image helps to run the Spark in a cluster mode with a master and variable slave (worker) nodes.

## Installation
0. Setup Docker and docker-compose first
1. Build the image using included Dockerfile ```docker-compose build```
2. Spin up a Spark cluster with 1 master and n slaves ```docker-compose scale master=1 slave=2```
3. Destroy the cluster ```docker-compose down```

## TODO
Need to add support for the following components:
1. Scala
2. PySpark
3. HDFS
4. Zeppelin
5. Jupyter
6. Instructions on setting up in Azure/AWS with Docker Swarm