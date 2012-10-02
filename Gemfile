source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3' # CHANGES: We only want to use sqlite3 in development.

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  # gem 'coffee-rails', '~> 3.2.1' # CHANGES: We don't want to use coffeescrip.

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano' # CHANGES: This was uncommented. Look in config/deploy.rb and config/deploy (eventually) for 

# To use debugger
# gem 'ruby-debug'


### CHANGES: Above is the default Gemfile generated by Rails. Everything added is below
# After adding new gems run `bundle install`

gem 'activeadmin' # create admin interface
gem 'meta_search' # for search within admin interface
gem 'formtastic' # simplifies form creation

group :development, :test do
  gem 'sqlite3' # use the sqlite3 database in development
  gem 'thin' # Use this webserver in development and test as it is faster than Webrick
  gem 'test-unit' # Use the latest test-unit
  gem 'rb-inotify' # Used for desktop notifications for tests. This might be different for Mac
end

group :development do 
  gem 'guard-livereload' # allows for browser reloading when code changes
  gem 'pry-rails' # helps with pretty debugging in the console  
end

group :test do
  gem 'capybara' # integration testing library allows for interacting with a page even within a real browser
  gem 'database_cleaner' # reset the database between tests so you are always at a known state
  gem 'launchy' # take a look at page state when running integration tests
end

group :assets do
  gem 'therubyracer', :platforms => :ruby # used for asset compilation
end

group :tools do
  gem 'guard-test' # allows for tests to run automatically when changes are made
end

group :staging, :production do
  gem 'mysql2' # use the mysql2 gem in staging and production environments
end



