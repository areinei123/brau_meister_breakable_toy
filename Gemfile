source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rspec-rails', group: [:development, :test]
gem 'capybara', group: [:development, :test]
gem 'launchy', group: [:development, :test]
gem 'factory_girl', group: [:development, :test]
gem 'valid_attribute', group: [:development, :test]
gem 'shoulda-matchers', group: [:development, :test], require: false
gem 'devise'
gem 'foundation-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'web-console', '~> 2.0'
  gem 'spring', '~>1.3.4'
end

group :test do
  gem 'coveralls', require: false
end

group :production do
  gem "puma"
  gem "rails_stdout_logging"
  gem "rails_12factor"
  gem "rails_serve_static_assets"
end
