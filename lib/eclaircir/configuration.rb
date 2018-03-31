# frozen_string_literal: true

module Clarifier
  class Configuration
    def initialize(
      env: ENV,
      api_key: nil)
      @api_key = api_key || env['CLARIFIER_API_KEY']
    end

    attr_accessor :api_key

    protected
    attr_reader :env
  end
end