class AddIndexToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :restaurant_id, :bigint
    add_index :menus, :restaurant_id
  end
end
