class Review < ApplicationRecord
  # Schema Information
    # t.text "content"
    # t.integer "editor_id"
	belongs_to :editor
end
