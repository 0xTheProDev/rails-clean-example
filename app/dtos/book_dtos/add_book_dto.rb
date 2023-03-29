# frozen_string_literal: true

module Dtos
  module BookDtos
    class AddBookDto < Dry::Struct
      transform_keys(&:to_sym)

      attribute :name, Types::String
    end
  end
end
