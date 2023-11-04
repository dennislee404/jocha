class OrderItem < ApplicationRecord
  belongs_to :order

  after_create :calc_price
  after_create :calc_total_price

  def calc_price
    price = self.price/100
    self.update_column(:price, price)
  end

  def calc_total_price
    total_price = self.quantity * self.price
    self.update_column(:total_price, total_price)

    order_total_price = order.total_price + self.total_price
    order.update_column(:total_price, order_total_price)
  end 
end
