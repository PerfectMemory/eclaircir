# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Output < BaseModel
    attribute :id, String
    attribute :status, Status
    attribute :created_at, Attributes::NullableDateTime
    attribute :model, Model
    attribute :input, Input
    attribute :data, Data
  end
end