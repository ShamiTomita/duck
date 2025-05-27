source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.0"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.0"

# React and API related gems
gem 'shakapacker', '~> 7.1'  # Webpack integration for Rails
gem 'react-rails'            # React integration
gem 'rack-cors'             # Handle Cross-Origin Resource Sharing (CORS)

# Authentication
gem 'devise'               # Authentication solution
gem 'omniauth'            # OAuth2 framework
gem 'omniauth-github'     # GitHub OAuth2 strategy
gem 'omniauth-rails_csrf_protection' # CSRF protection for OmniAuth

# API related
gem 'jbuilder'              # JSON builder
gem 'ruby-openai'           # OpenAI API integration
gem 'dotenv-rails'          # Environment variables management

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"         # Testing framework
  gem "factory_bot_rails"   # Test data generation
  gem "faker"              # Generate fake data
  gem "pry-rails"         # Better console
  gem "rubocop"          # Ruby code style checker
end

group :development do
  gem "web-console"
  gem "better_errors"       # Better error pages
  gem "binding_of_caller"  # REPL & local/instance variable inspection
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
