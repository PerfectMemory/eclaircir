# frozen_string_literal: true

module Eclaircir
  module Utilities
    class InputParser
      class << self
        def parse(*args)
          self.new(*args).input
        end
      end

      def initialize(
        url: nil,
        input: nil,
        io: nil,
        path: nil,
        base64: nil,
        content: nil)
        @possible_inputs = {
          url: url,
          input: input,
          io: io,
          path: path,
          base64: base64,
          content: content,
        }.compact
      end

      def input
        @input ||= build_input
      end

      protected
      attr_reader :possible_inputs

      def build_input
        validate!

        input_type = possible_inputs.keys.first
        values = Array(possible_inputs[input_type])

        case input_type
        when :input
          values
        when :url
          values.map do |value|
            Input.from_url(value)
          end
        when :base64
          values.map do |value|
            Input.from_base64(value)
          end
        when :content
          values.map do |value|
            Input.from_content(value)
          end
        when :io
          values.map do |value|
            Input.from_io(value)
          end
        when :path
          values.map do |value|
            Input.from_path(value)
          end
        end # the else case is impossible
      end

      def validate!
        if invalid_inputs?
          raise ArgumentError,
            "Exactly one kind of inputs should be provided"
        end

        true
      end

      def invalid_inputs?
        possible_inputs.size != 1
      end
    end
  end
end