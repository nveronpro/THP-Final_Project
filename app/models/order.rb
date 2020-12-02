class Order < ApplicationRecord

    has_many :order_users
    has_many :users, through: :order_users

    belongs_to :item
end
