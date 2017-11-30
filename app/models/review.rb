class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
  validates :comment, :booking, presence: true
end
