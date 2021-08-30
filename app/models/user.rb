class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :pets, through: :bookings
  validates :name, :address, :email, :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum user_type: [:owner, :sitter, :both]
  validates :email, format: { with: /\A.*@.*\.com\z/,
                              message: "Enter a valid email" }
end
