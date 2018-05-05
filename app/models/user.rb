class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
  has_many :orders

  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end
end
