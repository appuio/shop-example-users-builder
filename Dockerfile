# extend centos
FROM centos:7

# workaround for missing locale
ENV LC_ALL en_US.UTF-8

# specify the erlang version
ENV ERLANG_VERSION 19.3-1.el7.centos

# install utilities and erlang
RUN set -x && \
    yum install -y epel-release unzip wget && \
    wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm && \
    rpm -Uvh erlang-solutions-1.0-1.noarch.rpm && \
    yum install -y erlang-$ERLANG_VERSION

# specify the elixir version
ENV ELIXIR_VERSION 1.4.2

# install elixir
RUN set -x && \
    mkdir /usr/bin/elixir && \
    cd /usr/bin/elixir && \
    wget --no-check-certificate https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
    unzip Precompiled.zip && \
    rm Precompiled.zip

# add the elixir installation to path
ENV PATH $PATH:/usr/bin/elixir/bin

# initialize hex and rebar
RUN erl && \
    mix local.hex --force && \
    mix local.rebar --force

# add a new dir for the app
RUN mkdir /app
WORKDIR /app

# run shell as default command
CMD ["/bin/sh"]
