# frozen_string_literal: true

module BookDtos
  class AddBookDto < Types::Struct
    attribute :name, Types::String
  end
end
