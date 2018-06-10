# frozen_string_literal: true

module Eclaircir
  class Configuration
    def initialize(
      env: ENV,
      api_key: nil)
      @api_key = api_key || env['CLARIFAI_API_KEY']
    end

    attr_accessor :api_key

    protected
    attr_reader :env
  end
end