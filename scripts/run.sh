#!/usr/bin/env bash

#
# Starts containers defined by the docker-compose.yml file
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_common.sh

docker-compose up
