class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :commentscounter
      t.integer :likescounter
      t.integer :author_id

      t.timestamps
    end
    add_index :posts, :author_id
    add_foreign_key :posts, :users, column: :author_id

  end
end
