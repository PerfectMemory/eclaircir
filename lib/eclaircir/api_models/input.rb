# frozen_string_literal: true

require_relative 'base_model'

module Eclaircir
  class Input < BaseModel
    attribute :id, String
    attribute :data, Data

    class << self
      def from_url(url)
        self.new(
          data: Data.new(
            image: Media.new(url: url)))
      end

      def from_base64(base64)
        self.new(
          data: Data.new(
            image: Media.new(base64: base64)))
      end

      def from_content(file_content)
        from_base64(Base64.encode64(file_content))
      end

      def from_io(io)
        from_content(io.read)
      end

      def from_path(path)
        File.open(path) do |io|
          from_io(io)
        end
      end
    end

    def to_api_hash
      super.merge(data: data.to_api_hash).compact
    end
  end
end