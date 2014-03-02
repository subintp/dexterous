source 'https://rubygems.org'

gem 'rails', '4.0.2'

# Ruby Libraries
# ==============
gem 'mysql2'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'authority'

# Servers and deployment
# ======================
gem 'unicorn-rails'
# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Meta languages
# ==============
gem 'coffee-rails'
gem 'haml-rails'
gem 'stylus'

# Javascript libraries
# ====================
gem 'lodash-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'

# Asset post-processing and packaging
# ===================================
gem 'uglifier', '>= 1.3.0'

# Testing and mocking libraries
# =============================
group :development , :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-core', '~> 3.0.0.beta2',
    github: 'rspec/rspec-core',
    branch: 'master'
  %w[expectations mocks rails support].each do |name|
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
  gem 'konacha'
end

# Auxiliary utilities to ease development
# =======================================
group :development do
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'quiet_assets'
end
