# corp-check-test
e2e tests for corp-check services

## Architecture

The e2e tests binding point is the restful api: `corp-check-rest`. Tests are running in composed dokcer containers. The e2e test contains the following services:

- **MongoDB**: It is a basic MongoDB image.
- **RabbitMQ**: It is a basic RabbitMQ image with management tool.
- **Local npm registry**: That mocks the npm registry. Before running tests the test process publishes mock packages into this registry. They are in `registry/packages`. It is not possible to use a package name twice with the same version, because publishing runs only once before running the tests.
- **Search service for npm registry**: That mocks the npm's search service. To define mock scores for a package you should describe a `scores` property into its `package.json`. Examples in `registry/packages/...`
- **corp-check rest service**: This image is pulled from the corp-check docker registry in aws. The docker tag is provided from the `ENV` parameter (see below).
- **corp-check worker service**: This image is pulled from the corp-check docker registry in aws. The docker tag is provided from the `ENV` parameter (see below).
- **test process**: This process runs the tests with `jest`. This process consists of two parts: the registry initialization and the jest running. The registry initialization is defined in `registry/init.sh`

Every service is defined in `docker-compose.tpl.yml`. This template is manifested by the parameters.

## Parameters

- `ENV`: Value set: `dev`, `stage`, `prod`. That determines that which images should use for `corp-check-rest` and `corp-check-worker`.
- `AWS_CRED_SOURCE`: The `.aws` folder path on the host machine. It is necessary for docker login to pulling the corp-check service images.

## How to run

The e2e tests also can run as a compact job for CI tools, and they can run in watch mode for developing.

### CI mode

```
sh test.sh
```

### Watch mode

```
sh test.sh watch
```

Watch mode does not run the `test` process in docker. Instead of that it runs on your local machine in `--watch` mode with jest.