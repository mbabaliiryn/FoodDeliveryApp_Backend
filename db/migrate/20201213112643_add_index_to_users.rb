class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_index :users, :email
  end
end
