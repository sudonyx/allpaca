class Alpaca < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :colour, presence: true
  validates :location, presence: true
  validates :hat, presence: true
  validates :price_per_night, numericality: { greater_than: 0 }
end
