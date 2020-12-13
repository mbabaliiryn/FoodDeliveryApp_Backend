class AddIndexToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :order_id, :bigint
    add_index :reviews, :order_id
  end
end
