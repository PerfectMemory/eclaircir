# frozen_string_literal: true

module Clarifier
  module Attributes
    class NullableDateTime < Virtus::Attribute
      def coerce(value)
        if value.nil? || value.is_a?(DateTime)
          value
        else
          DateTime.parse(value)
        end
      end
    end
  end
end