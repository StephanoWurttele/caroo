class Review < ApplicationRecord
  belongs_to :car

  validates :content, presence: true
  validates :rating, :inclusion => 1..5
end
