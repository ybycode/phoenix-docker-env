#!/usr/bin/env bash

#
# Get the environment name set in ../config/env.txt,
# and source the corresponding config file.
#

# stop in case of error
set -eo pipefail

THIS_DIR="$( cd "$( dirname "$0" )" && pwd )"

# cd to where the docker-compose.yml file is:
cd $THIS_DIR/..

ENV_FILENAME=$(readlink -f config/env.txt) # absolute filename because it can
                                           # be printed in errors.


if [[ ! -e "$ENV_FILENAME" ]]; then
    echo Error: environment name not configured:
    echo Please create the file $ENV_FILENAME from the template file ${ENV_FILENAME}.template
    echo Exiting
    exit 1
fi

ENV=$(cat $ENV_FILENAME | tr -d '[[:space:]]')
env_file=$(readlink -f config/env-${ENV}.sh)

if [[ ! -e "$env_file" ]]; then
    echo Error: the file $env_file doesn\'t exist. Create it or change the value\
 in $ENV_FILENAME.
    echo Exiting
    exit 1
fi

source $env_file

