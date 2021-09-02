class Pet < ApplicationRecord
  PET = ["Dog", "Cat", "Bird", "Other"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :pet_type, inclusion: { in: PET }
  has_one_attached :photo
  enum available: [:Available, :Unavailable, :Booked]
  # if available = "Available"/0
  validates :available_from, presence: true
  validates :available_till, presence: true
  validates :booking_requirements, presence: true
  # end
end
