class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :entity_type, :string
    add_index :users, :entity_type
    add_column :users, :entity_id, :bigint
    add_index :users, :entity_id
  end
end
