class Cart < ApplicationRecord
    belongs_to :user

    has_many :cart_orders
    has_many :orders, through: :cart_orders
end
