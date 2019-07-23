class Seat < ApplicationRecord
  belongs_to :room
  has_many :showtime_seats, dependent: :destroy
end
