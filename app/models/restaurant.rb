class Restaurant < ApplicationRecord
  restaurant_types = ["chinese", "italian", "japanese", "french", "belgian"]
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, :phone_number, presence: true
  validates :category, inclusion: { in: restaurant_types, message: "%{value} is not a valid size" }
end
