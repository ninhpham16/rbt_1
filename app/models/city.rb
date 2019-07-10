class City < ApplicationRecord
  has_many :theater
  validates :name, presence: true, uniqueness: true
end
