# frozen_string_literal: true

module Dtos
  module AuthorDtos
    class AuthorDto < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Integer
      attribute :first_name, Types::String
      attribute :last_name, Types::String
    end
  end
end
