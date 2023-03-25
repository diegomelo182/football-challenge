#
## Build API
#
FROM ruby:3.2.0 as build-api
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app
COPY ./api/Gemfile ./api/Gemfile.lock ./
RUN apt-get update &&\
    apt-get install libmariadb-dev &&\
    bundle install
COPY ./api .

#
## API service
#
FROM build-api as api
CMD rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'

#
## API unit tests
#
FROM build-api as unit-test
CMD rails test
