# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Media < BaseModel
    attribute :url, String
    attribute :base64, String

    def to_api_hash
      super.compact
    end
  end
end