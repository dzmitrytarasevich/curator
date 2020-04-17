#!/bin/bash

set -e

docker run -td \
    --label test \
    --name $JOB_BASE_NAME \
    --restart on-failure:5 \
    $JOB_BASE_NAME
