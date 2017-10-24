class BooksLocation < ApplicationRecord
	belongs_to :book
	belongs_to :location
end
