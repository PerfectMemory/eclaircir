# frozen_string_literal: true

module Clarifier
  class Client
    include HTTParty

    base_uri(Clarifier::API_ENDPOINT)

    headers 'Content-type' => 'application/json'

    def initialize(api_key)
      @api_key = api_key
    end

    def models(options = {})
      get('/models', query: options)
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
  end
end

require_relative 'client/status_validator'
