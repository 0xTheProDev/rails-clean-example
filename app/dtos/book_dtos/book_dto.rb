# frozen_string_literal: true

require_relative '../author_dtos'

module Dtos
  module BookDtos
    class BookDto < Types::Struct
      attribute :id, Types::Integer
      attribute :name, Types::String
      attribute :authors, Types::Array.of(::Dtos::AuthorDtos::AuthorDto)
    end

    BookListDto = Types::Array.of(BookDto)
  end
end
