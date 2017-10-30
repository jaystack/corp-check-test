#!/bin/bash

CWD=$(dirname $0)

cp registry/npmrc ~/.npmrc
NPM_CONFIG_REGISTRY=http://localhost npm publish "$CWD/packages/a"