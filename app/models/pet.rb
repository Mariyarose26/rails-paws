class Pet < ApplicationRecord
  PET = ["Dog", "Cat", "Bird", "Other"]
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :pet_type, inclusion: { in: PET }
  has_one_attached :photo
  belongs_to :user
end
