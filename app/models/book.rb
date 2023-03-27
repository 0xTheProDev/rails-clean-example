# frozen_string_literal: true

class Book < ApplicationRecord
  has_belongs_to_many :authors
end
