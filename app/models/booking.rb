class Booking < ApplicationRecord
  enum status: [:approved, :denied, :cancelled]
  belongs_to :user
  belongs_to :pet
  validates :start_date, :end_date, presence: true
  # validates :pet, uniqueness: { scope: :user }
end
