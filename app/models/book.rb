# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :authors, class_name: 'Author'
  validates :name, presence: true

  def add_author(author)
    authors << author
    self
  end
end
