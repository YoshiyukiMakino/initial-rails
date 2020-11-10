# initial rails

## 開発環境構築

### 初回

```
docker-compose build
docker-compose run --rm app bundle install
docker-compose run --rm app yarn
docker-compose run --rm app ./bin/rake db:drop db:create db:migrate db:seed
```

### 起動

```
docker-compose up -d
docker-compose logs -f
```

## 停止

```
docker-compose stop
```

## executed

```
# Rails new
docker-compose run --rm app bundle exec rails new . --force --no-deps --database=mysql --skip-test --skip-sprockets --skip-coffee --skip-turbolinks
# Gemfileにforeman追加してbundle install
docker-compose run --rm app bundle install
# config/database.ymlを変更して、DB create
docker-compose run --rm app ./bin/rake db:create db:migrate db:seed
```

## todo

Gemfiles

- procution
  - devise
  - aws s3 etc
  - sidekiq
  - active storage or carrierwave
  - slack-notifier
  - pundit
  - ransack
  - paranoia
  - simple_form
  - kaminari
- development
  - guard
  - rubocop
  - simplecov
  - codecov
  - vcr
  - capybara
  - selenium-webdriver
  - webdrivers
  - brakeman
  - faker
  - letter_opener_web
  - bullet
  - factory bot & custom rspec

npm
- bootstrap
- select2

rails
- locale
- lib/templates
- settings ( rails config )
- credentials

infra
- circleci
- terraform
- mail

