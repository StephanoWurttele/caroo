class User < ApplicationRecord
  has_many: cars
  has_many: bookings, through: cars
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, existance: true, uniqueness: true
  validates :name, existance: true

end
