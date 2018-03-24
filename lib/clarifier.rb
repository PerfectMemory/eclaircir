# frozen_string_literal: true

require 'json'

require 'httparty'

module Clarifier
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end

require_relative 'clarifier/version'
require_relative 'clarifier/constants'
require_relative 'clarifier/configuration'
require_relative 'clarifier/client'
