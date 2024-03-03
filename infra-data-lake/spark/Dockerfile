FROM bitnami/spark:3.5.1
USER root
RUN install_packages curl
USER 1001
COPY _build/spark_jars /opt/bitnami/spark/jars/
RUN pip install pyspark==3.5.1
