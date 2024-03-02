#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# navigate to the appropriate directory
cd "infra-data-lake/$ENV" || { echo "Directory 'infra-data-lake/$ENV' not found"; exit 1; }

# check if docker-compose.yml exists in the directory
if [ ! -f "docker-compose.yml" ]; then
    echo "docker-compose.yml not found in directory 'infra-data-lake/$ENV'"
    exit 1
fi

# show docker-compose services status
docker-compose ps -a

# healthcheck loop
timeout=0
until docker-compose ps -q | xargs docker inspect --format='{{.State.Health.Status}}' | grep -v "healthy"; do
    echo "Waiting for services to become healthy..."
    sleep 5
    timeout=$((timeout+5))
    if [ $timeout -ge 30 ]; then
        echo "Timeout reached. Services are still not healthy."
        exit 1
    fi
done
