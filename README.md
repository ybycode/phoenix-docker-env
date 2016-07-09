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

2. For each exising environment, edit `config/env-XXX.sh` and
   `docker-compose-XXX.yml` to your liking.

To create another environment, say, "test":

- create the file `config/env-test.sh`,
- create the file `docker-compose-test.sh`.

## Build the images

    $ ./scripts/compose-build.sh

## Create a new phoenix project

Create a new phoenix project if needed:

    $ ./scripts/compose-run-cmd.sh mix phoenix.new . --app appName

## Run the phoenix server and postgresql

Run `scripts/compose-up.sh` to start the database and the server.
