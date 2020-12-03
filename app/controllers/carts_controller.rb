class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart.total_price = @cart.items.pluck(:price).sum.to_f
  end

end
