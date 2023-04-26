# frozen_string_literal: true

module Dtos
  module BookDtos
    class UpdateBookDto < Types::Struct
      attribute :id, Types::Integer.optional
      attribute :name, Types::String
    end
  end
end
