# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
gem 'rack-contrib', '~> 2.3'
gem 'rake', '~> 13.0.1'
gem 'puma', '~> 4.3.12'

gem 'sinatra', '~> 2.2.0', require: 'sinatra/base'
gem 'sinatra-contrib', '~> 2.2.0'

gem 'i18n', '~> 1.8.2'
gem 'config', '~> 2.2.1'

gem 'pg', '~> 1.2.3'
gem 'sequel_secure_password'
gem 'sequel', '~> 5.32.0'
gem 'sequel-seed', '~> 1.1', '>= 1.1.2'
gem 'jwt', '~> 1.5', '>= 1.5.4'

gem 'dry-initializer', '~> 3.0.3'
gem 'dry-validation', '~> 1.5.0'
gem 'dry-types', '1.5'

gem 'activesupport', '~> 6.0.0', require: false
gem 'fast_jsonapi', '~> 1.5'

# Linters
gem 'rubocop', require: false
gem 'rubocop-rake', require: false

group :test do
  gem 'ruby-debug-ide'
  gem 'debase'
  gem 'rspec', '~> 3.9.0'
  gem 'factory_bot', '~> 5.2.0'
  gem 'rack-test', '~> 1.1.0'
  gem 'database_cleaner-sequel', '~> 1.8.0'
end