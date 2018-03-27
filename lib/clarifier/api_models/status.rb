# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Status < BaseModel
    attribute :code, Integer
    attribute :description, String
  end
end