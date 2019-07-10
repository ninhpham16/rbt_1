class Movie < ApplicationRecord
  belongs_to :category

  has_attached_file :image
  validates_attachment :image,
  content_type: { content_type: /\Aimage\/.*\z/ },
  size: { less_than: 1.megabyte }
end
