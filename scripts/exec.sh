#!/usr/bin/env bash

#
# execute an arbitrary command in the (must be running) web container
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_common.sh

docker-compose exec web $*
