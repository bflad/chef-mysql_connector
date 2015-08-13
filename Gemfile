source 'https://rubygems.org'

gem 'rake'

group :test, :integration do
  gem 'berkshelf', '~> 3.2.4'
end

group :test do
  gem 'chefspec', '~> 4.0'
  gem 'foodcritic', '~> 3.0.3'
  gem 'rubocop', '~> 0.33'
end

group :integration do
  gem 'busser-serverspec', '~> 0.5.7'
  gem 'kitchen-vagrant', '~> 0.18'
  gem 'test-kitchen', '~> 1.4'
end

# group :development do
#   gem 'guard',         '~> 2.0'
#   gem 'guard-kitchen'
#   gem 'guard-rubocop', '~> 1.0'
#   gem 'guard-rspec',   '~> 3.0'
#   gem 'rb-inotify',    :require => false
#   gem 'rb-fsevent',    :require => false
#   gem 'rb-fchange',    :require => false
# end
