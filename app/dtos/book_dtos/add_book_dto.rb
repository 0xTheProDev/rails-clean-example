# frozen_string_literal: true

module Dtos
  module BookDtos
    class AddBookDto < Types::Struct
      attribute :name, Types::String
    end
  end
end
