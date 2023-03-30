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
## API sidekiq
#
FROM build-api as sidekiq
CMD bundle exec sidekiq -C config/sidekiq.yml

#
## API unit tests
#
FROM build-api as unit-test
CMD rspec

#
## Frontend
#
FROM node:16 as build-frontend
WORKDIR /usr/src/app
COPY ./front-end .
RUN npm install

#
## Frontend service
#
FROM build-frontend as frontend
RUN npm run build
CMD npm start
