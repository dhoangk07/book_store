class AddPriceToBooks < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :price, :float, default: 0.0
  end
end
