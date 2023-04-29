# frozen_string_literal: true

class Publication < ApplicationRecord
  belongs_to :author, class_name: 'Author'
  belongs_to :book, class_name: 'Book'

  def save
    begin
      super
    rescue ActiveRecord::RecordNotUnique
      true
    end
  end
end
