#!/usr/bin/env bash

#
# run the containers and execute an arbitrary command in the web container
#

# stop in case of error
set -eo pipefail

usage="./phoenix.new.sh APPNAME"
if [[ $# -ne 1 ]]; then
    echo Bad number of arguments.
    echo Usage: $usage
    exit 1
fi

source $(dirname $0)/_set-env.sh

docker-compose run --rm web mix phoenix.new . --app $1

