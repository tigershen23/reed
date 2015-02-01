require 'rails_helper'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.disable_monkey_patching!

  # Factorygirl helpers
  config.include FactoryGirl::Syntax::Methods

  # Database Cleaner stuff
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

