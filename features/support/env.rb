require 'simplecov'
SimpleCov.start

require 'aruba/cucumber'
require 'database_cleaner/active_record'
require 'factory_bot'
require 'timecop'

require_relative '../../lib/support/active_record_connector'

World(FactoryBot::Syntax::Methods)

DatabaseCleaner.strategy = :truncation

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

ENV['TASKTRACKER_ENV'] = 'test'

FactoryBot.definition_file_paths = %w(spec/factories)
FactoryBot.find_definitions
