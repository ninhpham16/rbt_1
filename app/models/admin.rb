class Admin < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 10 }
  has_many :notifications
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
