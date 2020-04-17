#!/bin/bash

set -e

docker image build --force-rm --no-cache --tag "$JOB_BASE_NAME" .