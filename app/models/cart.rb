class Cart < ApplicationRecord
    belongs_to :user

    has_many :item_carts
    has_many :items, through: :item_carts
end
