# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[7.0]
  def up
    create_table :authors do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false

      t.timestamps
    end
  end

  def down
    drop_table :authors
  end
end
