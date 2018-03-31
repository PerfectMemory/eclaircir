# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Input < BaseModel
    attribute :id, String
    attribute :data, Data

    class << self
      def from_url(url)
        self.new(
          data: Data.new(
            image: Media.new(url: url)))
      end
    end

    def to_api_hash
      super.merge(data: data.to_api_hash).compact
    end
  end
end