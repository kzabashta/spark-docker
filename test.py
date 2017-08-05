import pyspark
conf = pyspark.SparkConf()

conf.setMaster("spark://<docker machine IP>:7077")
conf.setAppName('test')

sc = pyspark.SparkContext(conf=conf)

rdd = sc.parallelize(range(100))
print(rdd.reduce(lambda x,y: x+y))