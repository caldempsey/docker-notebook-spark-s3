# InfraSpark: Experimental Infrastructure for Data Lakes and Mock Blob Storage

Welcome to InfraSpark, your go-to solution for setting up a local experimental environment for data lakes and mock blob storage, powered by Pyspark and Spark clusters. This repository offers a seamless way to mimic Azure Blob Storage locally, providing you with the flexibility and convenience to develop and experiment with data processing pipelines and analytics in a controlled environment.

## Features

- **Mock Blob Storage**: Drop anything into `infra-mock-blob-storage`, and it instantly becomes available to your notebooks, replicating the behavior of Azure Blob Storage locally.
- **Spark Cluster**: Utilize a Spark cluster configured with Docker containers, allowing you to distribute computing tasks and process large-scale datasets efficiently.
- **Pyspark Notebooks**: Dive into data exploration, analysis, and visualization with Jupyter notebooks powered by Pyspark, enabling you to interactively develop and iterate on your data processing workflows.

## Getting Started

To get up and running with InfraSpark, follow these simple steps:

1. Clone this repository to your local machine.
2. Ensure you have Docker installed.
3. Install [just](https://github.com/casey/just).
4. Call `just deploy`.
5. Access the Jupyter notebook interface at `http://localhost:8890` and enter the token `canttouchthis`.
6. Start experimenting with data lakes, mock blob storage, and Pyspark notebooks!

## Repository Structure

- `infra-data-lake/localhost`: Run Delta Lake and notebooks to connect locally.
- `infra-mock-blob-storage`: Anything you drop in here becomes available to the notebooks. It's a local mock for Azure Blob Storage.
- `svc-hello-world`: Placeholder for any additional services or components.
- `notebook-data-lake`: Contains notebooks for data exploration and analysis.

## Docker Compose Configuration

The provided Docker Compose file sets up the necessary services and volumes for seamless integration between the Spark cluster and Jupyter notebooks. Customize the configuration according to your specific requirements and use cases.

## Contribution

We welcome contributions from the community to enhance and expand the capabilities of InfraSpark. Whether it's adding new features, fixing bugs, or improving documentation, your contributions are valuable in making this project better for everyone.

## License

This project is licensed under the [MIT License](LICENSE), allowing you to use, modify, and distribute the code freely. Refer to the license file for more details.

---

Start harnessing the power of data lakes and mock blob storage with InfraSpark. Dive in, explore, and unleash the potential of your data with ease!
