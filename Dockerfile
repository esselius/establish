FROM ruby:2.2

RUN mkdir -p /app/bin

WORKDIR /app

ENV PATH /app/bin:$PATH

COPY Gemfile Gemfile.lock /app/
COPY vendor /app/vendor

RUN bundle install --local

ADD . /app
