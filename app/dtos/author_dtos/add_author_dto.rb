# frozen_string_literal: true

require 'types'

module Dtos
  module AuthorDtos
    class AddAuthorDto < Dry::Struct
      transform_keys(&:to_sym)

      attribute :first_name, Types::String
      attribute :last_name, Types::String
    end
  end
end
