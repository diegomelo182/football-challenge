# Football Challenge

## First steps before get started

I recommend you run the following commands below:

1. Please make a copy and paste of the env file (this is needed for setting up the Docker)

```bash
$ cp .env.sample .env && cp .env.sample api/.env && cp .env.sample-frontend front-end/.env
```

2. Run the migrations and seed

```bash
$ docker-compose run --rm api rails db:create db:migrate db:seed
```

### If you didn't run the migrations of the Test environment database yet please use the command below then

```bash
$ docker-compose run --rm api-unit-test rails db:create db:migrate RAILS_ENV=test
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

3. For running the api sidekiq you can use the command below

```bash
$ docker-compose up api-sidekiq
```

4. For running the Api unit tests use the command below

```bash
$ docker-compose up api-unit-test
```

5. For running the NextJs frontend use the command below

```bash
$ docker-compose up frontend
```

Also I've created a **Rake task for running the Notification clean up** just running the command below:

```bash
$ docker-compose run --rm api rails notifications:remove_old_records
```

I did this rake task thinking that it can be added to a cron, however, there are other ways for doing this. Ex: **Sidekiq Pro** or using **sidekiq-cron**
