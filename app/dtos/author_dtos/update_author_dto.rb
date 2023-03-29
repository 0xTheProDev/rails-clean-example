# frozen_string_literal: true

module Dtos
  module AuthorDtos
    class UpdateAuthorDto < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Integer.optional
      attribute :first_name, Types::String
      attribute :last_name, Types::String
    end
  end
end
