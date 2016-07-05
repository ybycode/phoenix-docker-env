FROM elixir:1.3
MAINTAINER Yann B. <ybycode@gmail.com>

ENV PHOENIX_VERSION 1.1.4

ENV DEBIAN_FRONTEND noninteractive

# a user is created so that it won't be root inside the container:
RUN useradd -m user

ENV HOME=/home/user

RUN set -x                                                     \
    && apt-get update -qq                                      \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash -  \
    && apt-get install -y                                      \
        inotify-tools                                          \
        postgresql-client                                      \

    # DEV ONLY
    && apt-get install -y nodejs                               \
    && npm install --global brunch                             \

    ## PROD ONLY getting deps, compiling elixir code:
    #&& MIX_ENV=prod && mix deps.get   \
    #                && mix compile    \

    # cleaning
    && apt-get clean && apt-get autoremove

# install of phoenix, hex, rebar:
RUN mix archive.install --force                                                             \
    https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez \
    && mix local.hex --force                                                                \
    && mix local.rebar --force

# finally, make everything the user's files:
RUN chown -R user:user /home/user \
    && mkdir /server

# PROD ONLY
#ADD ./server /server

WORKDIR /server

USER user

