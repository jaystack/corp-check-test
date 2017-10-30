#!/bin/bash

CWD=$(dirname $0)

npm adduser <<- EOF
test
test
test@test.test
EOF

npm publish "$CWD/packages/a"