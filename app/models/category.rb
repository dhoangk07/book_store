class Category < ApplicationRecord
  # Schema Information
  # t.string "name"
	has_many :books
end
