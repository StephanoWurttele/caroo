class User < ApplicationRecord
  has_many :cars
  has_many :bookings, through: :cars
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  geocoded_by :address
 
  after_validation :geocode, if: :will_save_change_to_address?

end
