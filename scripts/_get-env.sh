#!/usr/bin/env bash

#
# Get the environment name set in ../config/env.txt,
# and source the corresponding config file.
#
# Do not use this script directly, it is run by _common.sh.
# It's supposed the CWD is one level upper this file.

# stop in case of error
set -eo pipefail

env_filename=$(readlink -f config/env.txt)

if [[ ! -e "$env_filename" ]]; then
    echo Error: environment name not configured:
    echo Please create the file $env_filename from the template file ${env_filename}.template
    echo Exiting
    exit 1
fi

ENV=$(cat $env_filename | tr -d '[[:space:]]')
source ${THIS_DIR}/../config/env-${ENV}.sh

