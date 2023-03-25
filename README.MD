# Football Challenge

## First steps before get started

I recommend you run the following commands below:

1. Please make a copy and paste of the env file (this is needed for setting up the Docker)

```bash
$ cp .env.sample .env && cp .env.sample api/.env
```

2. Run the migrations

```bash
$ docker-compose run --rm api rails db:create db:migrate
```

## How to run this project?

1. For running all the containers you can use the following command

```bash
$ docker-compose up
```

2. For running the api you can use the command below

```bash
$ docker-compose up api
```
2. For running the Api unit tests use the command below

```bash
$ docker-compose up api-unit-test
```
### If you didn't run the migrations of the Test environment database yet please use the command below then
```bash
$ docker-compose run --rm api-unit-test rails db:create db:migrate RAILS_ENV=test
```
