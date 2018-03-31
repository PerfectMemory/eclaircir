# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Concept < BaseModel
    attribute :id, String
    attribute :name, String
    attribute :app_id, String
    attribute :value, Float
  end
end