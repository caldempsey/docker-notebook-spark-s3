#!/bin/bash

cd infra-data-lake/spark
# Spark jars are built from scratch in-case of changes
docker build -t orgname/data_lake_spark .
docker tag orgname/data_lake_spark orgname/data_lake_spark:latest
echo "✅ Spark apps built."