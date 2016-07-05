## Docker elixir/phoenix environment

Elixir/phoenix development environment using Docker and Docker-compose.
It uses Docker and Docker-compose, and builds an environment containing
elixir, phoenix, brunch (and nodejs), postgresql.

## Dependencies

- [Docker engine](https://docs.docker.com),
- [Docker-compose](https://docs.docker.com/compose/)

## Configuration

1. Edit one of the existing environment configuration files in `config`,
   or create a new one having `env-` as prefix, and `.sh` as extension
   (like `env-prod.sh`).
2. Create the file `config/env.txt` to indicate the name of the environment
   to use.
   For example, if you want to use the environment variables defined in
   `config/env-prod.sh`, write `prod` in `config/env.txt`.

## Build the images

    $ ./scripts/build.sh

## Create a new phoenix project

Create a new phoenix project if needed:

    $ ./scripts/run-cmd.sh mix phoenix.new . --app appName

## Run the phoenix server and postgresql

Run `scripts/run.sh` to start the database and the server.
