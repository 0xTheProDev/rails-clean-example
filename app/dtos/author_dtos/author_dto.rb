# frozen_string_literal: true

module Dtos
  module AuthorDtos
    class AuthorDto < Types::Struct
      attribute :id, Types::Integer
      attribute :first_name, Types::String
      attribute :last_name, Types::String
    end

    AuthorListDto = Types::Array.of(AuthorDto)
  end
end
