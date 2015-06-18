FROM ruby:2.2

RUN mkdir -p /app/bin

WORKDIR /app

ENV PATH /app/bin:$PATH

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN bundle install --deployment

ADD . /app
