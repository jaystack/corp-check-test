#!/bin/bash

CWD=$(dirname $0)

echo "NPM_CONFIG_REGISTRY: $NPM_CONFIG_REGISTRY"

npm adduser <<EOF
test
test
test@test.test
EOF

npm publish "$CWD/packages/a"