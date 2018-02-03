#!/usr/bin/env sh

docker build \
  --build-arg NODE_DOCKER_VERSION=${NODE_DOCKER_VERSION:-9.5.0} \
  --force-rm \
  --no-cache \
  --compress \
  -t rms1000watt/dummy-nodejs-project:latest .
