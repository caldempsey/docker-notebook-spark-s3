#!/bin/bash

rm -rf infra-data-lake/spark/_build
mvn_command="mvn -f infra-data-lake/poms/spark.pom dependency:copy-dependencies -DoutputDirectory=../spark/_build/spark_jars -Dscope=provided"

# Execute Maven command
if ! $mvn_command; then
    echo "❌ Error occurred while downloading Spark dependencies."
    exit 1
else
    echo "✅ Spark dependencies download completed successfully."
fi
