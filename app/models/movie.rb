class Movie < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :category_id, presence: true 
  has_attached_file :image
  validates_attachment :image,
  content_type: { content_type: /\Aimage\/.*\z/ },
  size: { less_than: 1.megabyte }
end
