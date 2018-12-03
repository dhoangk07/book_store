class Comment < ApplicationRecord
  # Schema Information
    # t.text "content"
    # t.integer "book_id"
	belongs_to :book
end
