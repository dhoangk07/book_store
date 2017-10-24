class Book < ApplicationRecord
	validates_presence_of :title
	
	belongs_to :publisher
	has_many :comments
	has_many :books_locations
	has_many :locations, through: :books_locations

	def increase_view_count
		update_column(:view_count, view_count + 1)
	end
end
