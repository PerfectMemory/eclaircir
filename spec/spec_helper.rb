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

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
