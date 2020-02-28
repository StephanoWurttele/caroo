class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews,dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  KINDS = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
  TRANS = ['Manual', 'Automatic']
  validates :model, presence: true
  validates :brand, presence: true
  validates :kind, presence: true, inclusion: {in: KINDS}
  validates :price, presence: true
  validates :description, presence: true
  validates :doors, presence: true, inclusion: {in: (1..5).to_a}
  validates :transmission, presence: true, inclusion: {in: TRANS}

  include PgSearch::Model
  pg_search_scope :search_by_everything,
    against: [ :brand, :model, :doors, :year, :transmission, :kind ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_not_kind,
    against: [ :brand, :model, :doors, :year, :transmission],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_not_transmission,
    against: [ :brand, :model, :doors, :year, :kind ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_not_both,
    against: [ :brand, :model, :doors, :year],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  
  def info
    "#{self.brand.capitalize} #{self.model}, #{self.kind.downcase}."
  end

  def owner
    self.user.username
  end

  include PgSearch
  pg_search_scope :search, against: [:brand, :model], using: {tsearch: {prefix: true, any_word: true}}
end
