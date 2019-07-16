class MovieTheater < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  belongs_to :room

  scope :date_like, ->(date){where "time LIKE ?", "%#{date}%"}
end
