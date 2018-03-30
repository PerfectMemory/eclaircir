# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Input < BaseModel
    attribute :id, String
    attribute :data, Data

    def to_api_hash
      super.merge(data: data.to_api_hash).compact
    end
  end
end