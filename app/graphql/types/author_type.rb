# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :books, [Types::BookType], null: false
    field :first_name, String, null: false
    field :id, ID, null: false
    field :last_name, String, null: false
  end
end
