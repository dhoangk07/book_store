class CreateBooksLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :books_locations do |t|
      t.integer :book_id
      t.integer :location_id

      t.timestamps
    end
  end
end
