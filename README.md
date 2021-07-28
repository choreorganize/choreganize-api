# Choreganize

This is the "backend" repository for the Chorganize application. It is responsible for sending api responses to our [frontend application](https://github.com/choreorganize/choreganize).

### About this Project

Chorganize is an application in which users can create, complete, and monitor chores for their household. Each chore is weighted by difficulty to ensure fairness across all the users of a household.

### Database Schema
<!-- upload image here -->

### Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Install the Figaro gem: `bundle exec figaro install`
6. Create an account with [Open Weather Map](https://home.openweathermap.org/users/sign_up) and request an API key
7. Add your API key to the `application.yml` created by Figaro:
  ```rb
  OPEN_WEATHER_KEY: your_api_key
  ```

## Versions

- Ruby 2.7.2

- Rails 5.2.6

## Important Gems
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem)
* [pry](https://github.com/pry/pry)
* [factory-bot-rails](https://github.com/thoughtbot/factory_bot_rails)
* [faker](https://github.com/faker-ruby/faker)
* [launchy](https://github.com/copiousfreetime/launchy)
* [json](https://github.com/flori/json)
* [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

API Consumption
* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)
## Running the tests

Run `bundle exec rspec` to run the test suite

## Deployment

See our app in action [here](<!--heroku link here -->)

## Contact
Created by

* Andrew Shaffer [GitHub](https://github.com/Aphilosopher30) • [LinkedIn](https://www.linkedin.com/in/andrew-shafer-0631ab20a/)
* Emmy Morris [GitHub](https://github.com/EmmyMorris) • [LinkedIn](https://www.linkedin.com/in/meaghanmorris1/)
* Kevin Nguyen [GitHub](https://github.com/denverdevelopments) • [LinkedIn](https://www.linkedin.com/in/kevin-nguyen-59510520a/)
* Suzie Kim [GitHub](https://github.com/suzkiee) • [LinkedIn](https://www.linkedin.com/in/kim-suzie/)
* Zach Trokey [GitHub](https://github.com/ztrokey) • [LinkedIn](https://www.linkedin.com/in/zach-trokey/)
