class Petsitter < ApplicationRecord
  has_many :bookings, dependent: :destroy
  # has_many :reviews, through: :booking
  belongs_to :user
  CATEGORIES = %w[chien chat éléphant kangal hamster tortue].freeze
  validates :description, :location, :category, :price, :user_id, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
