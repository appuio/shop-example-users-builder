# extend centos
FROM centos:7

# specify the erlang version
ENV ERLANG_VERSION 19.3-1.el7.centos

# install erlang
RUN set -x && \
  yum install -y epel-release wget && \
  yum update && \
  wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm && \
  rpm -Uvh erlang-solutions-1.0-1.noarch.rpm && \
  yum install -y erlang-$ERLANG_VERSION

# specify the elixir version
ENV ELIXIR_VERSION 1.4.2

# install elixir
RUN set -x  

# add the elixir installation to path

# initialize hex and rebar

# add a new dir for the app
RUN mkdir /app
WORKDIR /app

# run shell as default command
CMD ["/bin/sh"]
