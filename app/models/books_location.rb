class BooksLocation < ApplicationRecord
  # Schema Information
  # t.integer "book_id"
  # t.integer "location_id"
	belongs_to :book
	belongs_to :location
end
