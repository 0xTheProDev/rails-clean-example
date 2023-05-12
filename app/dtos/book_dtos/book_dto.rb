# frozen_string_literal: true

module BookDtos
  class BookDto < Types::Struct
    attribute :id, Types::Integer
    attribute :name, Types::String
    attribute :authors, Types::Array.of(::AuthorDtos::AuthorDto)
  end

  BookListDto = Types::Array.of(BookDto)
end
