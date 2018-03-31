# frozen_string_literal: true

require 'json'
require 'base64'

require 'httparty'
require 'virtus'
require 'active_support/core_ext/hash/compact'

module Eclaircir
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def new_client
      Client.new(configuration.api_key)
    end
  end
end

require_relative 'eclaircir/version'
require_relative 'eclaircir/constants'
require_relative 'eclaircir/error'
require_relative 'eclaircir/configuration'

require_relative 'eclaircir/api_models'

require_relative 'eclaircir/client'
