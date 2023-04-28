class CreatePublications < ActiveRecord::Migration[7.0]
  def up
    create_table :publications do |t|
      t.references :author, foreign_key: true
      t.references :book,   foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :publications
  end
end
