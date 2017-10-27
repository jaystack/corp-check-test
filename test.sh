#!/bin/bash

ENV="dev"
echo "ENV: $ENV"

# DETERMINE DOCKER IMAGE TAG
TAG=$([ "$ENV" == "prod" ] && echo "latest" || echo "$ENV")
echo "DOCKER IMAGE TAG: $TAG"

# CREATE PROPER docker-compose file
sed "s/%TAG%/$TAG/g" docker-compose.tpl.yml > docker-compose.yml
echo "docker-compose file:"
cat docker-compose.yml

# RUN CONTAINERS
echo "RUN CONTAINERS"
docker-compose up -d

# RUN TESTS
echo "RUN TESTS"
npm start

# REMOVE CONTAINERS
echo "REMOVE CONTAINERS"
docker-compose down -v --rmi all
