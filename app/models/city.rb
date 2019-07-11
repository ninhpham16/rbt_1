class City < ApplicationRecord
  has_many :theater, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
