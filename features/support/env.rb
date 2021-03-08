require 'simplecov'
SimpleCov.start

require 'aruba/cucumber'
require 'timecop'

ENV['TASKTRACKER_ENV'] = 'test'
