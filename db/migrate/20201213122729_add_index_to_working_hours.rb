class AddIndexToWorkingHours < ActiveRecord::Migration[6.0]
  def change
    add_column :working_hours, :restaurant_id, :bigint
    add_index :working_hours, :restaurant_id
  end
end
