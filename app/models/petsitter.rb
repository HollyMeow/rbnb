class Petsitter < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  CATEGORIES = %w[chien chat éléphant kangal hamster tortue].freeze
  validates :description, :location, :category, :price, :user_id, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  has_attachment :photo
end
