# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    field :id, ID, null: false
    field :name, String, null: false
  end
end
