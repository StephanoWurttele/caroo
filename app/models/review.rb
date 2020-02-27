class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :content, presence: true
  validates :rating, :inclusion => 1..5
end
