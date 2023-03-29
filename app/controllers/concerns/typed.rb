# frozen_string_literal: true

module Concerns
  class Typed
    def self.included(base)
      base.extend TypedClassMethods
    end

    module TypedClassMethods
      attr_reader :input_class

      def params(input)
        input = input_class[*input] if input_class

        super(input)
      end

      def input(klass = nil)
        unless klass.is_a?(Dry::Types::Type)
          raise 'Unsupported input class. Use one of the provided Types'
        end
        @input_class = klass
      end
    end
  end
end
