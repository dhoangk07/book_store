class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Schema Information
    # t.string "name"
    # t.string "sex"
    # t.integer "age"
    # t.string "address"
    # t.string "email", default: "", null: false
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
