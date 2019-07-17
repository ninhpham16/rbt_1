class MovieTheater < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  belongs_to :room
  has_many :order_items, dependent: :destroy

  scope :date_like, ->(date) { where "time LIKE ?", "%#{date}%" }
end
