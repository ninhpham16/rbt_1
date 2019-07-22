class Order < ApplicationRecord
  
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: proc { |attr| attr[:seat_id].blank? }
  before_save :update_total
  
  def total
    total = self.order_items.length*50000
    return total
  end

private
  
  def update_total
    self[:total] = total
  end

end
