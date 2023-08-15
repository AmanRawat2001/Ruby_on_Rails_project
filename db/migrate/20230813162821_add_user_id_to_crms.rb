class AddUserIdToCrms < ActiveRecord::Migration[7.0]
  def change
    add_column :crms, :user_id, :integer
    add_index :crms, :user_id
  end
end
