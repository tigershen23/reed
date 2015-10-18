ENV['ACCEPTANCE'] = 'true'
require 'rails_helper'

require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl_rails'

# Require pages for semantic specs
support_dir = Rails.root.join('spec', 'acceptance', 'support')
require support_dir.join('pages', 'page')
Dir[support_dir.join('**', '*.rb')].each { |f| require f }

Capybara.default_wait_time = 20
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) { DatabaseCleaner.clean }
end

