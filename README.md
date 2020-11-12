# README

* Ruby version : 2.5.5

* Rails version : 5.2.4.4

* Database : postgresql

* Background server : Sidekiq

# Setup steps

* Clone the app

* run `bundle install`

* run `rake db:migrate`

* start rails server, redis-server and sidekiq

# Algorithm for generating the URL short code

* Use `rand(36**8).to_s(36)` random string for generate short_code.
