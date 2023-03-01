class AddUserRefToCommets < ActiveRecord::Migration[7.0]
  def change
    add_reference :commets, :author, null: false, foreign_key: true
  end
end
