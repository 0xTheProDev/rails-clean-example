# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  validates :name, presence: true

  def add_author(author)
    self.authors << author
    self
  end
end
