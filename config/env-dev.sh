#!/usr/bin/env bash

export DOCKER_USER_GROUP_ID=$(id -u)
export DOCKER_USER_ID=$(id -u)
export ELIXIR_SECRET="some secret"
export MIX_ENV=dev
export POSTGRES_DATA=/server/db/pgdata
export POSTGRES_PASSWORD="1234"
export PORT_HTTP=4080
export PORT_HTTPS=4443
export SERVER_URL="example.com"

