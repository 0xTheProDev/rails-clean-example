# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def up
    create_table :books do |t|
      t.string :name, null: false

      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
