class Movie < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :category_id, presence: true
  has_attached_file :image
  validates_attachment :image,
                       content_type: { content_type: %r{\Aimage/.*\z} },
                       size: { less_than: 1.megabyte }
end
