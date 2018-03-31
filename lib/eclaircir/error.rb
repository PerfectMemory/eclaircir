# frozen_string_literal: true

module Clarifier
  class Error < StandardError
  end

  class APIError < Error
  end

  class InvalidAuthTokenError < APIError
  end

  class ApiKeyNotFoundError < APIError
  end

  class BadRequestFormatError < APIError
  end

  class InvalidRequestError < APIError
  end

  class DuplicateURLError < APIError
  end

  class ImageDecodingError < APIError
  end
end