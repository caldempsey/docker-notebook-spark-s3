![localhost/build](https://github.com/caldempsey/docker-notebook-spark-s3/actions/workflows/localhost_build.yml/badge.svg)

# DockerNotebookSparkS3

This repository provides a local experimental environment for data lakes and mock blob storage, leveraging PySpark and Spark clusters. It allows you to mimic Blob Storage locally and manage it with an Jupyter Notebook connected to a Spark Cluster closely emulating a real but simple environment. 

This setup uses `mvn` to pull artefacts and transitive dependencies for Spark, e.g. [Databricks Delta Lake](https://delta.io), used as an example in this template, directly into the Spark's jars without any requirement for network requests from Spark, providing an effective template for the CI deployment for data processing pipelines and analytics in a secure or controlled setting.

Effortlessly dive in and unleash your data's potential, today!

## Features

- **Mock Blob Storage**: Mimics Blob Storage locally, enabling seamless integration with notebooks.
- **Spark Cluster**: Configured with Docker containers for distributed computing tasks and large-scale dataset processing. Dependencies are managed via the `infra-data-lake` pom file and pulled onto the repository via `mvn`-based bash `get_spark_deps.sh`.
- **PySpark Notebooks**: Jupyter notebooks for interactive data exploration and analysis. These run in [driver or cluster mode](https://spark.apache.org/docs/latest/cluster-overview.html). There's an (issue ticket open to implement Client/Cluster asynchronous programming)[https://github.com/caldempsey/docker-notebook-spark-s3/issues/3], and goes into some detail on what tools you need to enable this.
- **CI/CD Heath Checks:** Implemented using bash, GitHub Actions, and Docker Compose, CI health checks ensure services are built, up, and healthy before merging to a protected main.

## Getting Started

Use `make` or follow these steps to set up the environment via Just:

1. Clone this repository.
2. Ensure Docker is installed.
3. Install [just](https://github.com/casey/just).
4. Run `just deploy`.
5. Access Jupyter at `http://localhost:8890` with token `canttouchthis`.
6. Start experimenting with data lakes, mock blob storage, and PySpark notebooks!

## Repository Structure

- `infra-data-lake/localhost`: Delta Lake and notebooks for local connectivity.
- `infra-mock-blob-storage`: Local mock for Blob Storage.
- `notebook-data-lake`: Contains notebooks for data exploration and analysis.

Commands should be run from the root of the repository or using Just.

## Configuration

Customize the template for your specific requirements and use cases. Since everything is hard coded for the moment, you probably want to find and replace the term `orgname` to suit you.

Happy Coding! ✨
