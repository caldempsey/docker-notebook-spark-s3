alias describe := help
alias list := help 
alias deploy-local := deploy
alias start := deploy

# lists available commands
help:
  just --list

deploy:
    mkdir -p notebook-data-lake/src
    mkdir -p notebook-data-lake/data
    chmod -R 777 ./notebook-data-lake/src
    chmod -R 777 ./notebook-data-lake/data
    cd infra-data-lake/localhost && docker-compose up
