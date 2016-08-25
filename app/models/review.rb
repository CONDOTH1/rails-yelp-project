class Review < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  validates :user_id, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
  validates :rating, inclusion: (1..5)
end
