# frozen_string_literal: true

module Eclaircir
  class Client
    class StatusValidator
      def initialize(response)
        @response = response
      end

      def validate!
        return true if main_status.success?

        sub_statuses.each(&:validate!)

        main_status.validate!
      end

      protected
      attr_reader :response

      def main_status
        response.status
      end

      def sub_statuses
        response.outputs.map(&:status)
      end
    end
  end
end