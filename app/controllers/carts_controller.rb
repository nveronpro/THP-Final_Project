class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find_by(user_id: params[:id])
  end

  def update
    @cart = find_cart
    @cart.update(carts_params)
    redirect_to @cart
  end

  def edit
    @cart = find_cart
  end

  def ask_email
    @cart = find_cart
    @order = Order.create(user_id: current_user.id)
    @cart.items.each do |item|
      AssociateOrderItem.create(order: @order, item: item)
    end
    @cart.items.destroy_all
  end

  private

  def carts_params
    params.require(:cart).permit(:adress, :adress_sup, :ville, :code)
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end
  
end
