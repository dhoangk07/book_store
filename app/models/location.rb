class Location < ApplicationRecord
  # Schema Information
    # t.string "name"
    # t.string "street"
    # t.string "address"
    # t.string "district"
	has_many :books_locations
	has_many :books, through: :books_locations
end
