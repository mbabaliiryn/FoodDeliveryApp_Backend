class AddIndexToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :restaurant_id, :bigint
    add_index :orders, :restaurant_id
  end
end
