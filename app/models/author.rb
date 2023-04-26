# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, class_name: 'Book'
  validates :first_name, :last_name, presence: true
end
