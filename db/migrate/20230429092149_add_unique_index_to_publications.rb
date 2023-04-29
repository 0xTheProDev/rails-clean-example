class AddUniqueIndexToPublications < ActiveRecord::Migration[7.0]
  def up
    add_index :publications, column: [:author_id, :book_id], unique: true
  end

  def down
    remove_index :publications, column: [:author_id, :book_id], unique: true
  end
end
