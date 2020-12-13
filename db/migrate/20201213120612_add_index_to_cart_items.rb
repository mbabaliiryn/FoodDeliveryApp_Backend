class AddIndexToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :food_item_id, :bigint
    add_index :cart_items, :food_item_id
  end
end
