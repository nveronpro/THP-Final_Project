class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true,  :inclusion => 0..1000
end
