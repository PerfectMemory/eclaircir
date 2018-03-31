# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Data < BaseModel
    attribute :image, Media
    attribute :concepts, Array[Concept]

    def to_api_hash
      super.tap do |api_hash|
        api_hash[:image] = image.to_api_hash if image
        api_hash[:concepts] = concepts.map(&:to_api_hash) if concepts
      end.compact
    end
  end
end