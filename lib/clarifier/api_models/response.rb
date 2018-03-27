# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Response < BaseModel
    attribute :status, Status
    attribute :outputs, Array[Output]
  end
end