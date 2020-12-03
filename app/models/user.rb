class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :cart_create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart

  has_many :order_users
  has_many :orders, through: :order_users

  def cart_create
    Cart.create(user: self)
  end
end
