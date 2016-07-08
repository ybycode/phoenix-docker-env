#!/usr/bin/env bash

#
# Get mix deps, compile them, and get npm dependencies
#

# stop in case of error
set -eo pipefail

source $(dirname $0)/_set-env.sh

docker-compose run --rm -e MIX_ENV=$MIX_ENV web mix deps.get
docker-compose run --rm -e MIX_ENV=$MIX_ENV web mix compile
docker-compose run --rm -e MIX_ENV=$MIX_ENV web npm install

echo DONE!
