source 'https://rubygems.org'

#Integrate it with google api
gem 'gmail'
#allow the app to send mailer
gem 'actionmailer'

#datetimepicker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'


gem 'email_verifier'
gem 'email_validator'
gem 'bcrypt'
gem 'rerun'

gem 'bootstrap-datepicker-rails'
gem 'jquery-ui-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
#For date validation
gem 'validates_timeliness', '~> 4.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 2.3.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'haml-rails'
# gem 'jquery_datepicker'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#autosize
gem 'autosize-rails'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'byebug'
    gem 'cucumber-rails', :require => false
    gem 'cucumber-rails-training-wheels'
    gem 'database_cleaner'
    gem 'rspec-rails'
    gem 'simplecov'    
    gem 'capybara', '2.4.4'
    gem 'launchy'
    gem 'rack_session_access'
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'
  
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
group :production do
  gem 'pg' # for Heroku deployment
  gem 'rails_12factor'
end
group :development do
  gem 'sqlite3'
end
