# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Media < BaseModel
    attribute :url, String
  end
end