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

    def predict_outputs(url: nil, input: nil)
      to_predict =  if url
                      Input.from_url(url)
                    elsif input
                      input
                    end

      if Array(to_predict).empty?
        raise ArgumentError,
          'one of the following keyword arguments should be provided [url, input]'
      end

      Eclaircir.new_client.predict_outputs(self, to_predict)
    end
  end
end