# README

# Heroku

* heroku link: https://authdevise90.herokuapp.com/
* heroku login
* heroku app:create authdevise90
* git push heroku main
* heroku run rake --trace db:migrate
* heroku info


# Web Page

* Dashboard page
 ![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/images/dashboardAdmin.png)

* Home page
![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/images/home_page.png)

* Manage my account page
![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/images/managemyaccount.png)

* Table with filter
 ![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/images/table_w_filter.png)

* Current_news_group_category_published
![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/images/Current_news_group_category_published.png)

* lio_word_trend
![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/images/lio_word_trend.png)


* reference
https://github.com/heartcombo/devise

* confirmation mail
https://mailcatcher.me/

* mailcatcher
gem install mailcatcher
mailcatcher
Go to http://127.0.0.1:1080/
Send mail through smtp://127.0.0.1:1025


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# AuthRegistration


# API Details

* Currents API provide news in 15 different languages across over 50 countries in forms of news, article, forum discussion topics.

* https://api.currentsapi.services/v1/latest-news?
apiKey=ppvVKctrJQz1oZb-RzjjrHr4fm34daUJqV-X3ZITDNbumJgL


apiKey=hxFz_ZAZV-JDRZYOq1SH7wq_s_opv3dNcMtVm9MvS2At6Kpf

* We also serve a list of supported language and country code which you can use to filter your results
-- https://api.currentsapi.services/v1/available/categories
-- https://api.currentsapi.services/v1/available/regions
-- https://api.currentsapi.services/v1/available/languages

# pagination

* gem 'kaminari'
* rails g kaminari:config

# refrences
* https://buttercms.com/blog/json-serialization-in-rails-a-complete-guide
* https://github.com/Netflix/fast_jsonapi
* https://github.com/socketry/timers
* https://github.com/kaminari/kaminari for pagination
* https://api.rubyonrails.org/classes/ActiveRecord/ConnectionHandling.html#method-i-establish_connection connect w/db
* https://www.tutorialspoint.com/ruby/ruby_date_time.htm


gem 'dotenv-rails'

# erd diagram

ERD diagram
https://www.youtube.com/watch?v=_6YyLTL2BW4 
* gem 'rails-erd'
* bundle i
* sudo apt install graphviz  https://graphviz.org/download/
* bundle exec erd

# RestClient Handling Errors
 * https://github.com/rest-client/rest-client#response-callbacks-error-handling
 * https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html

# references:
* https://blog.appsignal.com/2020/06/17/using-service-objects-in-ruby-on-rails.html

# To Reset Sidekiq Dashboard
* Sidekiq::Stats.new.reset in *rails console*
* https://stackoverflow.com/questions/15834911/how-do-i-reset-my-sidekiq-counters

# Chart
-- in Gemfile
* gem 'chartkick'
* gem 'groupdate'

-- For Rails 6 / Webpacker, run:
* yarn add chartkick chart.js

-- And in app/javascript/packs/application.js, add:
* import "chartkick/chart.js"

# Test
* gem install rspec
* rspec --init creat rspec folder


* gem 'rsepc', '~> 3.0' #>= 3.0 && < 4.0
* gem install rspec -v 3.0.0

* rails stats: how much test did you cover from your code
