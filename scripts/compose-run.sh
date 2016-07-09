#!/usr/bin/env bash

#
# run the containers and execute an arbitrary command in the web container
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_set-env.sh

docker-compose -f docker-compose-base.yml      \
               -f $DOCKER_COMPOSE_FILE         \
               run --service-ports --rm web $*
