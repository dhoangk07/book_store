class Book < ApplicationRecord
	max_paginates_per 25
	validates_presence_of :title
	belongs_to :publisher
	belongs_to :category
	has_many :comments
	has_many :books_locations
	has_many :locations, through: :books_locations

	def increase_view_count
		update_column(:view_count, view_count + 1)
	end

	def self.search(search)
    search ? self.where('title ILIKE ?', "%#{search}%") : self
  end
end
