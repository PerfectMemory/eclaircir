# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Data < BaseModel
    attribute :image, Media
    attribute :concepts, Array[Concept]
  end
end