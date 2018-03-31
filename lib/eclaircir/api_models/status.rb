# frozen_string_literal: true

require_relative 'base_model'

module Clarifier
  class Status < BaseModel
    attribute :code, Integer
    attribute :description, String

    def success?
      code == SUCCESS
    end

    def validate!
      unless success?
        error_class = ERRORS_MAPPINGS.fetch(code, APIError)
        raise error_class, description
      end

      true
    end

    # statuses
    SUCCESS = 10_000

    FAILURE = 10_020

    INVALID_AUTH_TOKEN = 11_001
    API_KEY_NOT_FOUND = 11_009

    BAD_REQUEST_FORMAT = 11_100
    INVALID_REQUEST = 11_102

    DUPLICATE_URL = 30_100
    IMAGE_DECODING_FAILED = 30_300

    ERRORS_MAPPINGS = {
      INVALID_AUTH_TOKEN    => InvalidAuthTokenError,
      API_KEY_NOT_FOUND     => ApiKeyNotFoundError,
      BAD_REQUEST_FORMAT    => BadRequestFormatError,
      INVALID_REQUEST       => InvalidRequestError,
      DUPLICATE_URL         => DuplicateURLError,
      IMAGE_DECODING_FAILED => ImageDecodingError,
    }.freeze
  end
end