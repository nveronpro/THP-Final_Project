class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true,  :inclusion => 0..1000

  has_many :order_items
  has_many :orders, through: :order_items

  belongs_to :sub_category
  belongs_to :sub_type

  has_one_attached :avatar
end
