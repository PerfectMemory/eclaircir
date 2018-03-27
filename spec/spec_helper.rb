# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'dotenv'
Dotenv.load

require 'simplecov'

SimpleCov.start do
  add_filter ENV['GEM_HOME'] if ENV.fetch('GEM_HOME', '').include?('bundle')
  add_filter 'spec/support'
  add_filter '.bundle'
  add_group 'Library', 'lib'
  add_group 'Specs', 'spec'
end

require 'clarifier'
require 'pp'
require 'byebug'
require 'rspec'
require 'rspec/its'
require 'webmock/rspec'
require 'factory_bot'
require 'faker'

Dir["./spec/factories/**/*.rb"].sort.each do |factory|
  require factory
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods
end
