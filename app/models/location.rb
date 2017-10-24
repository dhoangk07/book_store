class Location < ApplicationRecord
	has_many :books_locations
	has_many :books, through: :books_locations
end
