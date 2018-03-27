# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Input < BaseModel
    attribute :id, String
    attribute :data, Data
  end
end