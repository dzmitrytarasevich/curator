#!/bin/bash

set -e

docker stop $(docker ps -a -q --filter name=$JOB_BASE_NAME) || true
docker rm -f $(docker ps -q -f status=exited) || true
docker rm -f $(docker ps -q -f status=created) || true