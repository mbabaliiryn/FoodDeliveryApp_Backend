class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :zipcode
      t.string :state

      t.timestamps
    end
  end
end
