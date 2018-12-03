class Publisher < ApplicationRecord
  # Schema Information
    # t.string "name"
    # t.string "address"
	has_many :books
end
