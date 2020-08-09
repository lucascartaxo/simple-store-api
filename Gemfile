source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg'
gem 'unicorn'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'fast_jsonapi'
gem 'money'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'simplecov'
  gem 'simplecov-shields-badge'
  gem 'annotate'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
