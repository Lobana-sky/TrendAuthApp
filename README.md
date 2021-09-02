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
 ![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/dashboardAdmin.png)

* Home page
![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/Home%20Page.png)

* Manage my account page
![alt text](https://github.com/Lobana-sky/AuthRegistration/blob/main/managemyaccount.png)


* reference
https://github.com/heartcombo/devise

* confirmation mail
https://mailcatcher.me/

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
