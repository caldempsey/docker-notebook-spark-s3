# Lists available commands
help:
	@echo "Available commands:"
	@echo "help                         - Shows available commands"
	@echo "build                        - Initializes environment (downloads dependencies via mvn, builds Spark and notebook Docker images)"
	@echo "onboard                      - Automated onbaording workflow to check installed dependencies"
	@echo "clean-deploy                 - Deletes all user containers then deploys locally"
	@echo "deploy DOCKER_COMPOSE_ARGS   - Deploys locally. Supports COMPOSE_ARGS=<foo> for trailing arguments"
	@echo "healthcheck ENV              - Do a health check across all services deployed by the docker-compose for an environment"
# Onboarding workflow
onboard:
	./infra-scripts/onboarding.sh

# Build workflow
build:
	./infra-scripts/get_spark_deps.sh
	./infra-scripts/build_spark_docker.sh
	./infra-scripts/build_notebook_docker.sh

# Deploy workflow
deploy:
	make build
	mkdir -p notebook-data-lake/src
	mkdir -p notebook-data-lake/data
	chmod -R 777 ./notebook-data-lake/src
	chmod -R 777 ./notebook-data-lake/data
	cd infra-data-lake/localhost && docker-compose up $(DOCKER_COMPOSE_ARGS)

healthcheck:
	./infra-scripts/health_check.sh ${ENV}

clean-deploy:
	docker rm -f $$(docker ps -a -q) || true
	make build
	mkdir -p notebook-data-lake/src
	mkdir -p notebook-data-lake/data
	chmod -R 777 ./notebook-data-lake/src
	chmod -R 777 ./notebook-data-lake/data
	cd infra-data-lake/localhost && docker-compose up $(DOCKER_COMPOSE_ARGS)
