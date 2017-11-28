class Petsitter < ApplicationRecord
  belongs_to :user
  CATEGORIES = %w[chien chat éléphant kangal hamster tortue].freeze
  validates :description, :location, :category, :price, :user_id, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
