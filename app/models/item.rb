class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true,  :inclusion => 0..1000

  has_many :item_carts
  has_many :carts, through: :item_carts

  belongs_to :sub_category
  belongs_to :sub_type

  has_many :orders

  has_one_attached :avatar
end
