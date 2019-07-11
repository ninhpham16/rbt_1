class Theater < ApplicationRecord
  belongs_to :city
  has_many :rooms, dependent: :destroy
end
