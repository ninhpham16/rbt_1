class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: proc { |attr| attr[:seat_id].blank? }
  before_save :update_total
  validates :total, numericality: { greater_than: 0 }

  def total
    total = order_items.length * 50_000
    total
  end

  def generate_qr
    require "google-qr"
    qr = GoogleQR.new(data: id.to_s, size: "200x200", margin: 4, error_correction: "L")
    qr.to_s
  end

  private

  def update_total
    self[:total] = total
  end
end
