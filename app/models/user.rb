class User < ApplicationRecord
  has_many :cars
  has_many :bookings, through: :cars
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

end
