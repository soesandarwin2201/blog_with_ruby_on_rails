class AddBioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :string
    add_index :users, :bio
  end
end
