FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /storiesist
WORKDIR /storiesist
COPY Gemfile /storiesist/Gemfile
COPY Gemfile.lock /storiesist/Gemfile.lock
RUN bundle install
COPY . /storiesist