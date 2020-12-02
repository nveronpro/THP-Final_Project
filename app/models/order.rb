class Order < ApplicationRecord

    has_many :cart_orders
    has_many :carts, through: :cart_orders

    has_many :order_items
    has_many :items, through: :order_items
end
