# frozen_string_literal: true

require 'json'

require 'httparty'
require 'virtus'
require 'active_support/core_ext/hash/compact'

module Clarifier
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

require_relative 'clarifier/version'
require_relative 'clarifier/constants'
require_relative 'clarifier/error'
require_relative 'clarifier/configuration'

require_relative 'clarifier/api_models'

require_relative 'clarifier/client'
