class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :calc_total_price

  def calc_total_price
    self.total_price = quantity * price

    order_total_price = order.total_price + self.total_price
    order.update_column(:total_price, order_total_price)
  end 
end
