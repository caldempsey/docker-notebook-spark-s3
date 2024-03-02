#!/bin/bash

cd infra-data-lake/notebook
ls -a 
docker build -t orgname/data_lake_notebook .
docker tag orgname/data_lake_notebook orgname/data_lake_notebook:latest
echo "✅ Notebook apps built."