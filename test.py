import pyspark
conf = pyspark.SparkConf()

conf.setMaster("spark://192.168.99.100:7077")
conf.setAppName('test')

sc = pyspark.SparkContext(conf=conf)

rdd = sc.parallelize(range(100))