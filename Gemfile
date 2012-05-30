source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'pg'
gem 'thin'


# Log in and authorization tools
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem "omniauth-google-oauth2", "~> 0.1.9"


# Test tools
group :test, :development do
  gem 'rspec-rails', "~> 2.10.1"
end

group :test do
  gem 'factory_girl_rails' # instead of fixtures
  gem 'capybara' # simulates user
  gem 'guard-rspec' # auto run on save 
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
