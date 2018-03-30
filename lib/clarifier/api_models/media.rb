# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Media < BaseModel
    attribute :url, String
  end
end