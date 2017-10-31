#!/bin/bash

echo "INIT REGISTRY"

CWD=$(dirname $0)

echo "NPM_CONFIG_REGISTRY: $NPM_CONFIG_REGISTRY"

echo "CREATE NPM USER"

npm adduser << EOF
test
test
test@test.test
EOF

echo "PUBLISH MOCK NPM PACKAGES"

for testCase in `ls $CWD/packages`; do
  for package in `ls $CWD/packages/$testCase`; do
    echo "PUBLISH $package:"
    npm publish "$CWD/packages/$testCase/$package"
  done
done