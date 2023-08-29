class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :alpaca
  has_many :reviews, dependent: :destroy
end
