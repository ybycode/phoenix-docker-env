#!/usr/bin/env bash

#
# Build the containers defined by the docker-container.yml file.
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_set-env.sh

docker-compose build

