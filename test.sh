#!/bin/bash
# Ez lesz maga a jenkins script

# CLEAR PREVIOUS CONTAINERS IF EXIST
echo "CLEAR PREVIOUS CONTAINERS IF EXIST"
docker-compose rm -sfv

ENV="dev"
echo "ENV: $ENV"
AWS_CRED_SOURCE="~\/\.aws"
echo "AWS_CRED_SOURCE: $AWS_CRED_SOURCE"

# DETERMINE DOCKER IMAGE TAG
TAG=$([ $ENV == "prod" ] && echo "latest" || echo $ENV)
echo "DOCKER IMAGE TAG: $TAG"

# CREATE PROPER docker-compose file
sed -e "s/%TAG%/$TAG/g" -e "s/%AWS_CRED_SOURCE%/$AWS_CRED_SOURCE/g" docker-compose.tpl.yml > docker-compose.yml
echo "docker-compose file:"
cat docker-compose.yml

# DOCKER LOGIN
echo "DOCKER LOGIN"
$(aws ecr get-login --no-include-email --region eu-central-1)

if [ $1 == "watch" ]
then
  docker-compose up -d --build rabbit mongo registry rest worker
  NPM_CONFIG_REGISTRY=http://localhost sh registry/init.sh
  node registry/mock-search-service &
  npm run test:w
else
  # REBUILD TEST IMAGE
  echo "REBUILD TEST IMAGE"
  docker-compose build

  # RUN CONTAINERS
  echo "RUN CONTAINERS"
  docker-compose run test

  # CLEAR CONTAINERS
  echo "CLEAR CONTAINERS"
  docker-compose rm -sfv
fi