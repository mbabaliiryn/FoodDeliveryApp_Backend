class AddIndexToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :user_id, :bigint
    add_index :addresses, :user_id
  end
end
