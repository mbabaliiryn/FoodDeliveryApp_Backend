class CreateWorkingHours < ActiveRecord::Migration[6.0]
  def change
    create_table :working_hours do |t|
      t.time :starting_time
      t.time :end_time
      t.integer :status

      t.timestamps
    end
  end
end
