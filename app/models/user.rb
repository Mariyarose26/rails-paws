class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :pets
  has_one_attached :photo
  validates :first_name, :last_name, :address, :email, :user_type, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum user_type: [:owner, :sitter, :both]
  validates :email, format: { with: /\A.*@.*\.com\z/ }
end
