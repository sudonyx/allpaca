class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :alpaca
end
