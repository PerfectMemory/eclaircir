# frozen_string_literal: true

module Clarifier
  class BaseModel
    include Virtus.model

    def to_api_hash
      attributes
    end
  end
end