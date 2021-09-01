class Pet < ApplicationRecord
  PET = ["Dog", "Cat", "Bird", "Other"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :pet_type, inclusion: { in: PET }
  has_one_attached :photo
end
