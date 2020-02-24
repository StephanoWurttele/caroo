class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews,dependent: :destroy
  belongs_to :user
  validates :model, presence: true
  validates :brand, presence: true
  validates :type, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
