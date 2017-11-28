class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :petsitter

  validates :user, :petsitter, :date_start, :date_end, :total_price, :status, presence: true

end
