class Room < ApplicationRecord
  belongs_to :theater
  has_many :seats, dependent: :destroy
end
