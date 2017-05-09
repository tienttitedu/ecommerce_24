class Order < ApplicationRecord

  has_many :order_items

  before_save :update_subtotal

  scope :find_list_orders, -> { order(created_at: :desc) }

  def subtotal
    order_items.collect{|oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0}.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
