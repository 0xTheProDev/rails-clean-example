# frozen_string_literal: true

class Author < ApplicationRecord
  has_many  :publications, class_name: 'Publication'
  has_many  :books, class_name: 'Book', :through => :publications
  validates :first_name, :last_name, presence: true
end
