# frozen_string_literal: true

class Publication < ApplicationRecord
  belongs_to :author, class_name: 'Author'
  belongs_to :book, class_name: 'Book'
end
