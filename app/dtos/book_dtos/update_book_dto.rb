# frozen_string_literal: true

module Dtos
  module BookDtos
    class UpdateBookDto < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Integer.optional
      attribute :name, Types::String
    end
  end
end
