# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Response < BaseModel
    attribute :status, Status
    attribute :outputs, Array[Output]

    class << self
      def parse(raw_response)
        self.new(raw_response)
      end
    end
  end
end