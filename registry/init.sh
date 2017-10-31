#!/bin/bash

CWD=$(dirname $0)

echo "NPM_CONFIG_REGISTRY: $NPM_CONFIG_REGISTRY"

npm adduser << EOF
test
test
test@test.test
EOF

npm publish "$CWD/packages/a"
npm publish "$CWD/packages/b"
npm publish "$CWD/packages/c"
npm publish "$CWD/packages/d"
npm publish "$CWD/packages/e"
npm publish "$CWD/packages/f"