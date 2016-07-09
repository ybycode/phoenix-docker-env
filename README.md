## Docker elixir/phoenix environment

Elixir/phoenix development environment using Docker and Docker-compose.
It uses Docker and Docker-compose, and builds an environment containing
elixir, phoenix, brunch (and nodejs), postgresql.

## Dependencies

- [Docker engine](https://docs.docker.com),
- [Docker-compose](https://docs.docker.com/compose/)

## Configuration

1. By default, the existing environments are "dev" and "prod".
   Write the name of the environment you want to use in `config/env.txt`:

    ```
    echo dev > config/env.txt
    ```

2. For each exising environment, edit `config/ENV_NAME/env.sh` and
   `config/ENV_NAME/docker-compose-override.yml` to your liking.

To create another environment, say, "test":

- create the directory `config/test`,
- create the file `config/test/env.sh`,
- create the file `config/test/docker-compose-override.sh`.

## Build the images

    $ ./scripts/compose-build.sh

## Create a new phoenix project

Create a new phoenix project if needed:

    $ ./scripts/compose-run-cmd.sh mix phoenix.new . --app appName

## Run the phoenix server and postgresql

Run `scripts/compose-up.sh` to start the database and the server.
