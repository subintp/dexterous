source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'mysql2'
gem 'stylus'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'devise'

group :doc do
  gem 'sdoc', require: false
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

gem 'authority'
gem 'unicorn-rails'
gem 'react-rails'

group :development , :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  %w[ core expectations mocks rails support ].each do |name|
    gem "rspec-#{name}",
      github: "rspec/rspec-#{name}",
      branch: 'master'
  end
  gem 'guard-rspec', require: false
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'debugger'
end

group :development do
  gem 'guard-livereload', require: false
end
