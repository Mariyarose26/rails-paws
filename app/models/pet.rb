class Pet < ApplicationRecord
  PET = ["dog", "cat", "bird", "other"]
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :name, presence: true
  validates :type, inclusion: { in: PET }
end
