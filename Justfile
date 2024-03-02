alias describe := help
alias init := build
alias setup := build
alias list := help 
alias deploy-local := deploy
alias start := deploy

# lists available commands
help:
  just --list

# onboarding workflow
onboard:
    ./infra-scripts/onboarding.sh

# build workflow 
build: 
    ./infra-scripts/get_spark_deps.sh
    ./infra-scripts/build_spark_docker.sh
    ./infra-scripts/build_notebook_docker.sh

# perform a health check for services at an environment
healthcheck env:
	./infra-scripts/health_check.sh {{env}}

# deploys to a local environment, passes arguments to docker-compose
deploy args:
    docker rm -f $(docker ps -a -q) || true
    just build
    mkdir -p notebook-data-lake/src
    mkdir -p notebook-data-lake/data
    chmod -R 777 ./notebook-data-lake/src
    chmod -R 777 ./notebook-data-lake/data
    cd infra-data-lake/localhost && docker-compose up {{args}}
