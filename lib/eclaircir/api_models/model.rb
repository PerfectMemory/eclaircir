# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Model < BaseModel
    attribute :id, String
    attribute :name, String
    attribute :created_at, Attributes::NullableDateTime
    attribute :app_id, String
    attribute :output_info, Hash
    attribute :model_version, Hash

    def predict_outputs(*args)
      inputs = Utilities::InputParser.parse(*args)

      Eclaircir.new_client.predict_outputs(self, inputs)
    end
  end
end