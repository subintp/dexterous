source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'mysql2'
gem 'sass' # we need it for font-kit
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
gem 'haml-rails'
gem 'font-kit-rails'
gem 'react-rails'

group :development , :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-core', '~> 3.0.0.beta2',
    github: 'rspec/rspec-core',
    branch: 'master'
  %w[ expectations mocks rails support ].each do |name|
    gem "rspec-#{name}",
      github: "rspec/rspec-#{name}",
      branch: 'master'
  end
  gem 'rspec', '~> 3.0.0.beta2'
  gem 'guard-rspec',
    github: '907th/guard-rspec',
    branch: 'fix_249'

  # gem 'guard-rspec', require: false
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'debugger'
end

group :development do
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
end
