# frozen_string_literal: true

module BookDtos
  class BookThinDto < Types::Struct
    attribute :id, Types::Integer
    attribute :name, Types::String
  end

  BookThinListDto = Types::Array.of(BookThinDto)
end
