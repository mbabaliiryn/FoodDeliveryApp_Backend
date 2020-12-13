class AddIndexToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :customer_id, :bigint
    add_index :carts, :customer_id
  end
end
