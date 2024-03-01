# InfraSpark

This repository provides a local experimental environment for data lakes and mock blob storage, leveraging Pyspark and Spark clusters. It allows you to mimic Blob Storage locally, facilitating the development and experimentation of data processing pipelines and analytics in a controlled setting. A quick way to explore data lakes and mock blob storage effortlessly, dive in and unleash your data's potential!


## Features

- **Mock Blob Storage**: Mimics Blob Storage locally, enabling seamless integration with notebooks.
- **Spark Cluster**: Configured with Docker containers for distributed computing tasks and large-scale dataset processing.
- **Pyspark Notebooks**: Jupyter notebooks powered by Pyspark for interactive data exploration and analysis.

## Getting Started

Follow these steps to set up the environment:

1. Clone this repository.
2. Ensure Docker is installed.
3. Install [just](https://github.com/casey/just).
4. Run `just deploy`.
5. Access Jupyter at `http://localhost:8890` with token `canttouchthis`.
6. Start experimenting with data lakes, mock blob storage, and Pyspark notebooks!

## Repository Structure

- `infra-data-lake/localhost`: Delta Lake and notebooks for local connectivity.
- `infra-mock-blob-storage`: Local mock for Azure Blob Storage.
- `notebook-data-lake`: Contains notebooks for data exploration and analysis.

## Docker Compose Configuration

Customize the Docker Compose file for your specific requirements and use cases. The base cluster is configured to require 6GB RAM. Your notebook will thank you for increasing the RAM allocated to Docker OOTB.

---
