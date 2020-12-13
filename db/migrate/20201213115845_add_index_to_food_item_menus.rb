class AddIndexToFoodItemMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :food_item_menus, :menu_id, :bigint
    add_index :food_item_menus, :menu_id
  end
end
