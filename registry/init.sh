#!/bin/bash

echo "INIT REGISTRY"

CWD=$(dirname $0)

echo "NPM_CONFIG_REGISTRY: $NPM_CONFIG_REGISTRY"

echo "CREATE NPM USER"
npm run login -- -r $NPM_CONFIG_REGISTRY

echo ".NPMRC FILE:"
cat ~/.npmrc

echo "PUBLISH MOCK NPM PACKAGES"

for package in `ls $CWD/packages`; do
  echo "PUBLISH $package:"
  npm publish "$CWD/packages/$package"
done