class CreateAddressWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :address_workers do |t|

      t.timestamps
    end
  end
end
