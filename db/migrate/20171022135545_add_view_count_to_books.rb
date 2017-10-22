class AddViewCountToBooks < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :view_count, :integer, default: 0
  end
end
