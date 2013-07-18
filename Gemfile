source 'https://rubygems.org'

gem 'rails', '~> 3.2.13'
gem 'pg', '~> 0.14.0'
gem 'heroku', '~> 2.28.12'
gem 'bcrypt-ruby', '~> 3.0.1'
gem 'bootstrap-sass', '~> 2.2.2.0'
gem 'faker', '~> 1.0.1'
gem 'will_paginate', '~> 3.0.3'
gem 'bootstrap-will_paginate', '~> 0.0.6'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '~> 1.2.6'
end

gem 'jquery-rails', '~> 2.1.3'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'rspec-rails', '~> 2.10.0'
  gem 'guard-rspec', '~> 1.2.1'
end

group :test do
  gem 'rspec-rails', '~> 2.10.0'
  gem 'capybara', '~> 1.1.2'
  #gem 'rb-fsevent', '~> 0.9.1', :require => false
  #gem 'growl', '~> 1.0.3'
  gem 'rb-inotify', '~> 0.9'
  gem 'libnotify', '~> 0.5.9'
  gem 'guard-spork', github: 'guard/guard-spork'
  gem 'spork', '~> 0.9.2'
  gem 'factory_girl_rails', '~> 4.1.0'
end

group :production do
  gem 'thin', '~> 1.4.1'
end
