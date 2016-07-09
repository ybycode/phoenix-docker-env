#!/usr/bin/env bash

#
# run the containers and execute an arbitrary command in the web container
#

# stop in case of error
set -eo pipefail

usage="$0 APPNAME"
if [[ $# -ne 1 ]]; then
    echo Not enough arguments.
    echo Usage: $usage
    exit 1
fi

source $(dirname $0)/_set-env.sh

docker-compose -f docker-compose-base.yml      \
               -f $DOCKER_COMPOSE_FILE         \
               run --rm web mix phoenix.new . --app $1

