class AddINdexToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :cart_id, :bigint
    add_index :cart_items, :cart_id
  end
end
