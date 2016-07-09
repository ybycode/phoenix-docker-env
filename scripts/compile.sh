#!/usr/bin/env bash

#
# Get mix deps, compile them, and get npm dependencies
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_set-env.sh

docker-compose -f docker-compose-base.yml                                \
               -f $DOCKER_COMPOSE_FILE                                   \
               run --rm -e MIX_ENV=$MIX_ENV web mix do deps.get, compile

docker-compose -f docker-compose-base.yml                                \
               -f $DOCKER_COMPOSE_FILE                                   \
               run --rm -e MIX_ENV=$MIX_ENV web npm install

echo DONE!
