class Book < ApplicationRecord
	validates_presence_of :title
	
	belongs_to :publisher
	has_many :comments

	def increase_view_count
		update_attribute(:view_count, view_count + 1)
	end
end
