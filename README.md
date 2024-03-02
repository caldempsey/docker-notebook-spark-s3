# DockerNotebookSparkS3

This repository provides a local experimental environment for data lakes and mock blob storage, leveraging PySpark and Spark clusters. It allows you to mimic Blob Storage locally and manage it with an Jupyter Notebook connected to a Spark Cluster closely emulating a real but simple environment. 

This setup uses `mvn` to pull artefacts and transitive dependencies for Spark, e.g. [Databricks Delta Lake](https://delta.io), directly into the Spark's jars without network requests, providing an effective template for the CI deployment for data processing pipelines and analytics in a secure or controlled setting.

Effortlessly dive in and unleash your data's potential, today!

## Features

- **Mock Blob Storage**: Mimics Blob Storage locally, enabling seamless integration with notebooks.
- **Spark Cluster**: Configured with Docker containers for distributed computing tasks and large-scale dataset processing. Dependencies are managed via the `infra-data-lake` pom file and pulled onto the repository via `mvn`-based bash scripts e.g. `get_spark_deps`.
- **PySpark Notebooks**: Jupyter notebooks for interactive data exploration and analysis.

## Getting Started

Follow these steps to set up the environment:

1. Clone this repository.
2. Ensure Docker is installed.
3. Install [just](https://github.com/casey/just).
4. Run `just deploy`.
5. Access Jupyter at `http://localhost:8890` with token `canttouchthis`.
6. Start experimenting with data lakes, mock blob storage, and PySpark notebooks!

## Repository Structure

- `infra-data-lake/localhost`: Delta Lake and notebooks for local connectivity.
- `infra-mock-blob-storage`: Local mock for Azure Blob Storage.
- `notebook-data-lake`: Contains notebooks for data exploration and analysis.

Commands should be run from the root of the repository or using Just.

## Docker Compose Configuration

Customize the Docker Compose file for your specific requirements and use cases.
