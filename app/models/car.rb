class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews,dependent: :destroy
  belongs_to :user
  KINDS = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
  validates :model, presence: true
  validates :brand, presence: true
  validates :kind, presence: true, inclusion: {in: KINDS}
  validates :price, presence: true
  validates :description, presence: true

  def info
    "#{self.kind.capitalize} #{self.model}. #{self.brand}."
  end

end
