FROM ruby:2.6.5

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /workdir
WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler
RUN bundle install

ADD . /workdir

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh