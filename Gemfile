source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.3'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

gem 'traquitana'

gem 'mail_form'
gem 'simple_form'

gem 'figaro', '~> 1.1', '>= 1.1.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Gem for use of geolocation
gem 'geocoder', '~> 1.4', '>= 1.4.4'
# Using google maps
gem 'gmaps4rails'
# PAssing data to JS
gem 'gon', '~> 6.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# Gem to style the app follow the Material Design
# gem 'redis', '~> 3.0'
gem 'rack-cors'
gem 'material_icons'
gem 'materialize-sass'

gem 'responders'
gem 'underscore-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# gem "pagseguro-oficial", "~> 2.5.0"
# gem "pagseguro-oficial"
gem 'pagseguro-transparente'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  #  console
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  #  background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  #  in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
