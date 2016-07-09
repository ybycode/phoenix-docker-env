#!/usr/bin/env bash

#
# execute an arbitrary command in the (must be running) web container
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_set-env.sh

docker-compose -f docker-compose-base.yml      \
               -f $DOCKER_COMPOSE_FILE         \
               exec web $*
