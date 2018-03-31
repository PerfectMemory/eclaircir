# frozen_string_literal: true

module Clarifier
  class Client
    include HTTParty

    base_uri(Clarifier::API_ENDPOINT)
    format :json
    headers 'Content-Type' => 'application/json', 'Accept' => 'application/json'

    def initialize(api_key)
      @api_key = api_key
    end

    def models(options = {})
      get('/models', query: options)
    end

    def predict_outputs(model, inputs)
      with_response_parsing do
        validate post("/models/#{model.id}/outputs", body: {
          inputs: Array(inputs).map(&:to_api_hash)
        }.to_json)
      end
    end

    protected
    attr_reader :api_key

    def authorization_headers
      @authorization_headers ||= {
        'Authorization' => "Key #{api_key}"
      }
    end

    def get(path, query: nil)
      self.class.get(path,
        headers: authorization_headers,
        query: query)
    end

    def post(path, query: nil, body: nil)
      self.class.post(path,
        headers: authorization_headers,
        query: query,
        body: body)
    end

    def patch(path, query: nil, body: nil)
      self.class.patch(path,
        headers: authorization_headers,
        query: query,
        body: body)
    end

    def delete(path, query: nil, body: nil)
      self.class.delete(path,
        headers: authorization_headers,
        query: query,
        body: body)
    end

    def with_response_parsing
      Clarifier::Response.parse(yield).tap do |response|
        StatusValidator.new(response).validate!
      end
    end

    def validate(response)
      case response.code
      when 200..399
        response.parsed_response
      else
        raise_status_error(response.parsed_response)
      end
    end

    def raise_status_error(raw_response)
      status = raw_response['status']
      raise APIError, status['description']
    end
  end
end

require_relative 'client/status_validator'
