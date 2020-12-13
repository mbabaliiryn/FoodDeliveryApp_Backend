class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.decimal :delivery_range

      t.timestamps
    end
  end
end
