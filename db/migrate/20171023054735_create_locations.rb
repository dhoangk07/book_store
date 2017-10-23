class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street
      t.string :address
      t.string :district

      t.timestamps
    end
  end
end
