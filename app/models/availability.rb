class Availability < ApplicationRecord
  belongs_to :pet
  validates :available_from, presence: true
  validates :available_till, presence: true
  validates :booking_requirements, presence: true
end
