# frozen_string_literal: true

module BookDtos
  class UpdateBookDto < Types::Struct
    attribute :name, Types::String
  end
end
