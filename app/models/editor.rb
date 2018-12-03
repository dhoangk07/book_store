class Editor < ApplicationRecord
  # Schema Information
    # t.string "name"
    # t.string "phone"
    # t.integer "birth_year"
	has_many :reviews
end
