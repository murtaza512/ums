# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'activerecord-import', '~> 1.0', '>= 1.0.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'faker', '~> 2.14'
gem 'jbuilder', '~> 2.7'
gem 'searchkick'

gem 'sidekiq', '~> 6.1', '>= 6.1.3'
gem 'sidekiq-scheduler', '~> 3.0', '>= 3.0.1'

group :development, :test do
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'bullet', '~> 6.1', '>= 6.1.4'
  gem 'listen', '~> 3.2'
  gem "relaxed-rubocop" # https://relaxed.ruby.style/
  gem 'rubocop', require: false
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda', '~> 4.0.0'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
