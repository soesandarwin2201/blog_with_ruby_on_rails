class AddPostRefToCommets < ActiveRecord::Migration[7.0]
  def change
    add_reference :commets, :post, null: false, foreign_key: true
  end
end
