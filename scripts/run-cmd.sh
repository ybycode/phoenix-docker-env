#!/usr/bin/env bash

#
# run the containers and execute an arbitrary command in the web container
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_common.sh

docker-compose run --rm web $*
