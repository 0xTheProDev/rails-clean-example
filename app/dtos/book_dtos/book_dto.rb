# frozen_string_literal: true

module Dtos
  module BookDtos
    class BookDto < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Integer
      attribute :name, Types::String
      attribute :authors, Types::Array.of(AuthorDto)
    end
  end
end
