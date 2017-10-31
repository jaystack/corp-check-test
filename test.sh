#!/bin/bash
# Ez lesz maga a jenkins script

# CLEAR PREVIOUS CONTAINERS IF EXIST
echo "CLEAR PREVIOUS CONTAINERS IF EXIST"
docker-compose rm -sfv

ENV="dev"
echo "ENV: $ENV"

# DETERMINE DOCKER IMAGE TAG
TAG=$([ $ENV == "prod" ] && echo "latest" || echo $ENV)
echo "DOCKER IMAGE TAG: $TAG"

# CREATE PROPER docker-compose file
sed "s/%TAG%/$TAG/g" docker-compose.tpl.yml > docker-compose.yml
echo "docker-compose file:"
cat docker-compose.yml

# DOCKER LOGIN
echo "DOCKER LOGIN"
$(aws ecr get-login --no-include-email --region eu-central-1)

# REBUILD TEST IMAGE
echo "REBUILD TEST IMAGE"
docker-compose build

# RUN CONTAINERS
echo "RUN CONTAINERS"
docker-compose run --rm test npm start

# CLEAR CONTAINERS
echo "CLEAR CONTAINERS"
docker-compose rm -sfv