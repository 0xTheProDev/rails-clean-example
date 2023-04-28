# frozen_string_literal: true

class Book < ApplicationRecord
  has_many  :publications, class_name: 'Publication'
  has_many  :authors, class_name: 'Author', through: :publications
  validates :name, presence: true
end
