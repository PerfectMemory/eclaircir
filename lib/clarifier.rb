# frozen_string_literal: true

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
require_relative 'clarifier/configuration'
