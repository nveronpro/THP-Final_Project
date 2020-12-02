class CartOrder < ApplicationRecord
    belongs_to :order
    belongs_to :cart
end
