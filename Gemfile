source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.1.6'

group :default do
  gem 'bootstrap-sass',                     '~> 3.2.0.2'      # bootstrap stylesheets
  gem 'bootstrap-validator-rails'
  gem 'bcrypt-ruby',                        '~> 3.1.2'        # ActiveModel has_secure_password
  gem 'coffee-rails',                       '~> 4.0.0'        # CoffeeScript engine
  gem 'compass-rails',                      '~> 2.0.4'        # moar CSS/SASS
  gem 'faker',                              '~> 1.4.3'        # generate fake data
  gem 'font-awesome-sass',                  '~> 4.2.2'        # icons
  gem 'jquery-rails',                       '~> 3.1.2'        # jQuery for JavaScript
  gem 'pg',                                 '~> 0.17.1'       # database
  gem 'puma',                               '~> 2.10.2'       # app server
  gem 'sass-rails',                         '~> 5.0.1'        # SASS for stylesheets
  gem 'sprockets',                          '~> 2.11.3'       # asset packaging and compression
  gem 'turbolinks',                         '~> 2.5.2'        # speed up following links in app
  gem 'uglifier',                           '~> 1.3.0'        # JavaScript compressor
end

group :doc do
  gem 'sdoc',                               '~> 0.4.0'        # generate docs (bundle exec rake doc:rails)
end

group :development, :test do
  gem 'childprocess',                       '~> 0.5.5'        # control child processes/external programs
  gem 'dotenv-rails',                       '~> 1.0.2'        # manage env/config vars
  gem 'guard-rspec',                        '~> 4.3.1'        # watch and run tests
  gem 'guard-spork',                        '~> 1.5.1'        # spork integration with gaurd
  gem 'pry-rails',                          '~> 0.3.4'
  gem 'quiet_assets',                       '~> 1.0.3'        # silence asset loads in server logs
  gem 'rspec-rails',                        '~> 3.0.2'        # testing framework
  gem 'spork-rails',                        '~> 4.0.0'        # fork before running tests
end

group :development do
  gem 'awesome_print',                      '~> 1.2.0'        # pretty printing of Ruby outputs
  gem 'better_errors',                      '~> 2.0.0'        # nice, useful error pages
  gem 'binding_of_caller',                  '~> 0.7.2'        # dependency of better_errors
  gem 'spring',                             '~> 1.1.3'        # keep app running in background
end

group :test do
  gem 'capybara',                           '~> 2.4.4'        # simulate browser actions (uses selenium-wd)
  gem 'factory_girl_rails',                 '~> 4.5.0'        # generate test data
  gem 'database_cleaner',                   '~> 1.2.0'        # clean database in and around tests
  gem 'selenium-webdriver',                 '~> 2.44.0'       # browser automation/emulation
end

group :production do
  gem 'rails_12factor',                     '~> 0.0.3'        # heroku dependency, based on 12-factor app
end


