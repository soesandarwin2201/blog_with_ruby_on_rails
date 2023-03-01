class AddTitleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
    add_index :posts, :title
  end
end
