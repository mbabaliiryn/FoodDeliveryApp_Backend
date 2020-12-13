class CreateFoodItemMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :food_item_menus do |t|

      t.timestamps
    end
  end
end
