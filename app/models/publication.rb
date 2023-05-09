# frozen_string_literal: true

class Publication < ApplicationRecord
  belongs_to :author, class_name: 'Author'
  belongs_to :book, class_name: 'Book'

  def save(*args, **kwargs, &block)
    begin
      super(*args, **kwargs, &block)
    rescue ActiveRecord::RecordNotUnique
      true
    end
  end
end
