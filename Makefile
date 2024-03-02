# Lists available commands
help:
	@echo "Available commands:"
	@echo "help             - Shows available commands"
	@echo "build            - Initializes environment (downloads dependencies via mvn, builds Spark and notebook Docker images)"
	@echo "onboard          - Automated onbaording workflow to check installed dependencies"
	@echo "clean-deploy     - Deploys locally"
	@echo "deploy           - Deletes all user containers then deploys locally"

# Onboarding workflow
onboard:
	./infra-scripts/onboarding.sh

# Build workflow
build:
	./infra-scripts/get_spark_deps.sh
	./infra-scripts/build_spark_docker.sh
	./infra-scripts/build_notebook_docker.sh

deploy:
	make build
	mkdir -p notebook-data-lake/src
	mkdir -p notebook-data-lake/data
	chmod -R 777 ./notebook-data-lake/src
	chmod -R 777 ./notebook-data-lake/data
	cd infra-data-lake/localhost && docker-compose up

clean-deploy:
	docker rm -f $$(docker ps -a -q) || true
	make build
	mkdir -p notebook-data-lake/src
	mkdir -p notebook-data-lake/data
	chmod -R 777 ./notebook-data-lake/src
	chmod -R 777 ./notebook-data-lake/data
	cd infra-data-lake/localhost && docker-compose up
