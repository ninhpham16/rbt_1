class Theater < ApplicationRecord
  belongs_to :city
  has_many :rooms, dependent: :destroy
  has_many :movie_theaters, dependent: :destroy

  validates :name, presence: true
  validates :city_id, presence: true
end
