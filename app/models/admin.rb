class Admin < ApplicationRecord
  has_many :notifications, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4, maximum: 10 }
  validates :email, presence: true, length: { minimum: 10, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6, maximum: 15 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
