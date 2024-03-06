FROM jupyter/base-notebook:latest

USER root

# Install OpenJDK
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

# Install Scala
RUN wget "https://downloads.lightbend.com/scala/2.12.15/scala-2.12.15.tgz" && \
    tar -xvzf scala-2.12.15.tgz && \
    mv scala-2.12.15 /usr/lib && \
    rm scala-2.12.15.tgz

ENV SCALA_HOME=/usr/lib/scala-2.12.15
ENV PATH=$PATH:$SCALA_HOME/bin

# Install Apache Spark
ENV SPARK_VERSION=3.5.1
ENV HADOOP_VERSION=3

RUN wget "https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz" && \
    tar -xvzf spark-3.5.1-bin-hadoop3.tgz && \
    mv spark-3.5.1-bin-hadoop3 /usr/lib && \
    rm spark-3.5.1-bin-hadoop3.tgz

ENV SPARK_HOME=/usr/lib/spark-3.5.1-bin-hadoop3
ENV PATH=$PATH:$SPARK_HOME/bin

# Install findspark
RUN pip install findspark

# Install PySpark
RUN pip install pyspark==3.5.1 
RUN pip install delta-spark==3.1.0
