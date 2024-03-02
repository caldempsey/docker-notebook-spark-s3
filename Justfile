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

# confirms you have a working environment
helloworld:
    cd svc-hello-world && sbt run 

deploy:
    docker rm -f $(docker ps -a -q) || true
    just build
    mkdir -p notebook-data-lake/src
    mkdir -p notebook-data-lake/data
    chmod -R 777 ./notebook-data-lake/src
    chmod -R 777 ./notebook-data-lake/data
    cd infra-data-lake/localhost && docker-compose up
