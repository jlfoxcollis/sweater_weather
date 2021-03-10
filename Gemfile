source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'active_model_serializers'
gem 'jbuilder'
gem 'fast_jsonapi'
gem 'faraday'
gem 'figaro'

group :development, :test do
  gem 'pry'
  gem "shoulda-matchers"
  gem "orderly"
  gem "rails-erd"
  gem "awesome_print", :require => "ap"
  gem "factory_bot_rails"
  gem "faker"
  gem "hirb"
  gem "brakeman"
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem "webmock"
end

group :development do
  gem 'brakeman'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
