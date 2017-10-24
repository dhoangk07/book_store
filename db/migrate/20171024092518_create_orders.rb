class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.string :book
      t.string :customer
      t.float :total_price

      t.timestamps
    end
  end
end
