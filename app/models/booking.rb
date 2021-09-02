class Booking < ApplicationRecord
  enum status: [:pending, :approved, :denied], _default: :pending
  belongs_to :user
  belongs_to :pet
  validates :start_date, :end_date, presence: true
end
