# Define aliases
describe := help
init := build
setup := build
list := help
deploy-local := deploy
start := deploy

# Lists available commands
help:
	@echo "Available commands:"
	@echo "describe   - Shows available commands"
	@echo "init       - Initializes environment (builds Spark and notebook Docker images)"
	@echo "setup      - Alias for 'init'"
	@echo "list       - Alias for 'help'"
	@echo "deploy-local - Deploys locally"
	@echo "start      - Alias for 'deploy-local'"

# Onboarding workflow
onboard:
	./infra-scripts/onboarding.sh

# Build workflow
build:
	./infra-scripts/get_spark_deps.sh
	./infra-scripts/build_spark_docker.sh
	./infra-scripts/build_notebook_docker.sh

deploy:
	docker rm -f $$(docker ps -a -q) || true
	just build
	mkdir -p notebook-data-lake/src
	mkdir -p notebook-data-lake/data
	chmod -R 777 ./notebook-data-lake/src
	chmod -R 777 ./notebook-data-lake/data
	cd infra-data-lake/localhost && docker-compose up
