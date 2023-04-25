# rails-clean-example

[![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Rails](https://img.shields.io/badge/ruby%20on%20rails-%23CC0000.svg?style=for-the-badge&logo=rubyonrails&logoColor=white)](https://www.rubyonrails.org/)
[![Puma](https://img.shields.io/badge/puma-%23242B2F.svg?style=for-the-badge&logo=puma&logoColor=black)](https://puma.io/)
[![OpenAPI](https://img.shields.io/badge/openapi-6BA539?style=for-the-badge&logo=openapi-initiative&logoColor=fff)](https://www.openapis.org/)
[![RuboCop](https://img.shields.io/badge/rubocop-%23000000.svg?style=for-the-badge&logo=rubocop&logoColor=white)](https://www.rubocop.org/)
[![Open Issues](https://img.shields.io/github/issues-raw/0xTheProDev/rails-clean-example?style=for-the-badge)](https://github.com/0xTheProDev/rails-clean-example/issues)
[![Closed Issues](https://img.shields.io/github/issues-closed-raw/0xTheProDev/rails-clean-example?style=for-the-badge)](https://github.com/0xTheProDev/rails-clean-example/issues?q=is%3Aissue+is%3Aclosed)
[![Open Pulls](https://img.shields.io/github/issues-pr-raw/0xTheProDev/rails-clean-example?style=for-the-badge)](https://github.com/0xTheProDev/rails-clean-example/pulls)
[![Closed Pulls](https://img.shields.io/github/issues-pr-closed-raw/0xTheProDev/rails-clean-example?style=for-the-badge)](https://github.com/0xTheProDev/rails-clean-example/pulls?q=is%3Apr+is%3Aclosed)
[![Contributors](https://img.shields.io/github/contributors/0xTheProDev/rails-clean-example?style=for-the-badge)](https://github.com/0xTheProDev/rails-clean-example/graphs/contributors)
[![Activity](https://img.shields.io/github/last-commit/0xTheProDev/rails-clean-example?style=for-the-badge&label=most%20recent%20activity)](https://github.com/0xTheProDev/rails-clean-example/pulse)

## Description

_Example Application Interface using Rails framework in Ruby_

This example showcases Repository Pattern in Hexagonal Architecture _(also known as Clean Architecture)_. Here we have two Entities - Books and Authors, whose relationships have been exploited to create CRUD endpoint in REST under OpenAPI standard.

## Installation

- Install all the project dependency:

  ```sh
  $ bundle install
  ```

- Run the application:

  ```sh
  $ bundle exec rails s

## Testing

- Run test suite along with Coverage reporting:

  ```sh
  $ bundle exec rspec spec
  ```

## Swagger UI

- Generate OpenAPI specifications from RSpec:

  ```sh
  $ RAILS_ENV=test bundle exec rails rswag
  ```

- Open Swagger UI at `localhost:3000/api-docs` after running the application.

## License

&copy; MIT License
