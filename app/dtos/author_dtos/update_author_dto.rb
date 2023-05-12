# frozen_string_literal: true

module AuthorDtos
  class UpdateAuthorDto < Types::Struct
    attribute :first_name, Types::String
    attribute :last_name, Types::String
  end
end
